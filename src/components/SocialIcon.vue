<template>
    <div class="social-icon">
        <a :href="url" target="_blank">
            <img :src="icon" alt="Social icon" />
        </a>
    </div>
</template>
<script lang="ts">
import { defineComponent } from "vue";
export default defineComponent({
    name: "SocialIcon",
    props: {
        url: {
            type: String,
            required: true
        },
        icon: {
            type: String,
            required: true
        },
    },
});
</script>
<style lang="scss">
    .social-icon {
        display: flex;
        justify-content: flex-end;
        align-items: flex-end;
        width: 50px;
        height: 50px;

        img {
            width: 30px;
            height: 30px;
            filter:invert(.6);
            scale: 1;
            transition: all 0.3s;

            &:hover {
                scale: 1.05;
            }
        }
    }
</style>