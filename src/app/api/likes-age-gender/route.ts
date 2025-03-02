import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function GET() {
  try {
    const likesData:any = await prisma.$queryRaw`
      SELECT 
          da.age_range AS age_group, 
          dg.gender_name AS gender, 
          dd.date_value, 
          SUM((fam.custom_metrics->>'likes')::BIGINT) AS total_likes
      FROM fact_ad_metrics_daily fam
      JOIN dim_date dd ON fam.date_id = dd.date_id
      JOIN dim_age_group da ON fam.age_id = da.age_id
      JOIN dim_gender dg ON fam.gender_id = dg.gender_id
      WHERE dd.date_value >= CURRENT_DATE - INTERVAL '14 days'
      GROUP BY da.age_range, dg.gender_name, dd.date_value
      ORDER BY dd.date_value, da.age_range, dg.gender_name;
    `;

    // 🔥 Convert BigInt fields to strings
    const formattedData = likesData.map((item: any) => ({
      ...item,
      total_likes: item.total_likes ? item.total_likes.toString() : "0", // Convert BigInt to string
    }));

    return NextResponse.json(formattedData, { status: 200 });
  } catch (error) {
    console.error("Error fetching likes data:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 }
    );
  }
}
