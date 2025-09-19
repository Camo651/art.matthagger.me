<template>
    <div class="home">
        <GalleryGrid/>
    </div>
</template>
<script lang="ts">
import { defineComponent } from "vue";
import GalleryGrid from "@/components/GalleryGrid.vue";

export default defineComponent({
    name: "HomeView",
    components: {
        GalleryGrid
    },
});
</script>
