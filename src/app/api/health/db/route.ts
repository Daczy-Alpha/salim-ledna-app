import pool from "@/lib/postgres";

export async function GET() {
  try {
    await pool.query("SELECT 1");
    return Response.json({ status: "ok" });
  } catch (e) {
    return Response.json({ status: "db-failed" }, { status: 500 });
  }
}
