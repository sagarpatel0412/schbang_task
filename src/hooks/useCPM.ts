import { useQuery } from "@tanstack/react-query";
import axiosInstance from "../utils/axiosInstance";

export const useCPM = () => {
  return useQuery({
    queryKey: ["cpm"],
    queryFn: async () => {
      const { data } = await axiosInstance.get("/cpm-region");
      return data;
    },
  });
};
