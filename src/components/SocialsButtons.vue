<template>
    <div class="socials-buttons">
        <SocialIcon url="https://www.linkedin.com/in/matt-hagger/" :icon="require('@/assets/icons/linkedIcon.png')" />
        <SocialIcon url="mailto:matthagger64@gmail.com" :icon="require('@/assets/icons/emailIcon.png')" />
    </div>
</template>
<script lang="ts">
import { defineComponent } from "vue";
import SocialIcon from "./SocialIcon.vue";
export default defineComponent({
    name: "SocialsButtons",
    components: {
        SocialIcon,
    },
});
</script>
<style lang="scss">
    .socials-buttons {
        display: flex;
        justify-content: center;
    }
</style>