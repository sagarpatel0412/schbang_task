"use client";
import { Line } from "react-chartjs-2";
import { useCPM } from "../hooks/useCPM";
import { useLikes } from "../hooks/useLikes";
import { useCPC } from "../hooks/useCPC";
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from "chart.js";

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
);

export default function Charts() {
  const { data: cpmData, isLoading: isLoadingCPM } = useCPM();
  const { data: likesData, isLoading: isLoadingLikes } = useLikes();
  const { data: cpcData, isLoading: isLoadingCPC } = useCPC();

  if (isLoadingCPM || isLoadingLikes || isLoadingCPC) return <p>Loading...</p>;

  const cpmLabels = [
    ...new Set(
      cpmData.map(
        (item: any) => new Date(item.date_value).toISOString().split("T")[0]
      )
    ),
  ];
  const cpmRegions = [...new Set(cpmData.map((item: any) => item.region))];
  const cpmDatasets: any = cpmRegions.map((region) => ({
    label: region,
    data: cpmLabels.map(
      (date) =>
        cpmData.find(
          (item: any) =>
            new Date(item.date_value).toISOString().split("T")[0] === date &&
            item.region === region
        )?.cpm || 0
    ),
    borderColor: `rgba(${Math.random() * 255}, ${Math.random() * 255}, ${
      Math.random() * 255
    }, 1)`,
    fill: false,
  }));

  const likesLabels = [
    ...new Set(
      likesData.map(
        (item: any) => new Date(item.date_value).toISOString().split("T")[0]
      )
    ),
  ];


  const likesGroups = [
    ...new Set(
      likesData.map((item: any) => `${item.age_group} - ${item.gender}`)
    ),
  ];

  
  const likesDatasets: any = likesGroups.map((group) => ({
    label: group,
    data: likesLabels.map((date) => {
     
      const entries = likesData.filter(
        (item: any) =>
          new Date(item.date_value).toISOString().split("T")[0] === date &&
          `${item.age_group} - ${item.gender}` === group
      );

      
      const totalLikes = entries.reduce(
        (sum:any, entry:any) => sum + Number(entry.total_likes),
        0
      );

      return totalLikes || 0;
    }),
    borderColor: `rgba(${Math.random() * 255}, ${Math.random() * 255}, ${
      Math.random() * 255
    }, 1)`,
    fill: false,
  }));

  const cpcLabels = [
    ...new Set(
      cpcData.map(
        (item: any) => new Date(item.date_value).toISOString().split("T")[0]
      )
    ),
  ];

  const cpcAccounts = [
    ...new Set(cpcData.map((item: any) => item.account_name)),
  ];

  const cpcDatasets: any = cpcAccounts.map((account) => ({
    label: account,
    data: cpcLabels.map((date) => {
      const entries = cpcData.filter(
        (item: any) =>
          new Date(item.date_value).toISOString().split("T")[0] === date &&
          item.account_name === account
      );

      const totalCPC = entries.reduce(
        (sum: any, entry: any) => sum + entry.cpc,
        0
      );

      return totalCPC || 0;
    }),
    borderColor: `rgba(${Math.random() * 255}, ${Math.random() * 255}, ${
      Math.random() * 255
    }, 1)`,
    fill: false,
  }));

  if (isLoadingCPM && isLoadingLikes && isLoadingCPC) {
    return <div>loading</div>;
  }
  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold text-center mb-6">
        Analytics Dashboard
      </h1>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <div className="bg-white shadow-lg rounded-lg p-4">
          <h2 className="text-xl font-semibold text-gray-800 mb-2">
            CPM Trends (Last 7 Days)
          </h2>
          <Line data={{ labels: cpmLabels, datasets: cpmDatasets }} />
        </div>

        <div className="bg-white shadow-lg rounded-lg p-4">
          <h2 className="text-xl font-semibold text-gray-800 mb-2">
            Likes Trends (Last 14 Days)
          </h2>
          <Line data={{ labels: likesLabels, datasets: likesDatasets }} />
        </div>

        <div className="bg-white shadow-lg rounded-lg p-4">
          <h2 className="text-xl font-semibold text-gray-800 mb-2">
            CPC Trends (Last 7 Days)
          </h2>
          <Line data={{ labels: cpcLabels, datasets: cpcDatasets }} />
        </div>
      </div>
    </div>
  );
}
