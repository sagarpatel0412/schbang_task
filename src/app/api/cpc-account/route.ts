import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();


export async function GET() {
  try {
    const cpcData = await prisma.$queryRaw`
      SELECT 
          fam.platform_id AS account_id,  
          dp.platform_name AS account_name,
          dd.date_value,
          COALESCE(SUM(fam.cost) / NULLIF(SUM(fam.clicks), 0), 0) AS CPC
      FROM fact_ad_metrics_daily fam
      JOIN dim_date dd ON fam.date_id = dd.date_id
      JOIN dim_platform dp ON fam.platform_id = dp.platform_id
      WHERE dd.date_value >= CURRENT_DATE - INTERVAL '7 days'
      GROUP BY fam.platform_id, dp.platform_name, dd.date_value
      ORDER BY dd.date_value, dp.platform_name;
    `;

    return NextResponse.json(cpcData, { status: 200 });
  } catch (error) {
    console.error("Error fetching CPC data:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 }
    );
  }
}
