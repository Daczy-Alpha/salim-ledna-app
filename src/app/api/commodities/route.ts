import pool from "@/lib/postgres";

export async function GET() {
  const result = await pool.query("SELECT * FROM commodities");

  return Response.json(result.rows);
}
