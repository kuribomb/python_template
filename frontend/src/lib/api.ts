const API_BASE = 'http://localhost:8000';

export async function getHealth(): Promise<{ status: string }> {
	const res = await fetch(`${API_BASE}/health/`);
	if (!res.ok) throw new Error('API error');
	return res.json();
}
