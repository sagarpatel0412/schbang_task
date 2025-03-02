import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();


export async function GET() {
  try {
    const cpmData = await prisma.$queryRaw`
      SELECT 
          dr.region_name AS region, 
          dd.date_value, 
          COALESCE(SUM(fam.cost) / NULLIF(SUM(fam.impressions), 0) * 1000, 0) AS CPM
      FROM fact_ad_metrics_daily fam
      JOIN dim_date dd ON fam.date_id = dd.date_id
      JOIN dim_region dr ON fam.region_id = dr.region_id
      WHERE dd.date_value >= CURRENT_DATE - INTERVAL '7 days'
      GROUP BY dr.region_name, dd.date_value
      ORDER BY dd.date_value, dr.region_name;
    `;

    return NextResponse.json(cpmData, { status: 200 });
  } catch (error) {
    console.error("Error fetching CPM data:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 }
    );
  }
}
