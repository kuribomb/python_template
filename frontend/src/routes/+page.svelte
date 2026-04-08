<script lang="ts">
	import { onMount } from 'svelte';
	import { getHealth } from '$lib/api';

	let status = $state('loading...');

	onMount(async () => {
		try {
			const data = await getHealth();
			status = data.status;
		} catch {
			status = 'error';
		}
	});
</script>

<h1>myapp</h1>
<p>API status: {status}</p>
