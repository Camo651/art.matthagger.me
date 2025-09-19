<template>
    <div class="about">
        <img :src="require('@/assets/images/me.jpg')" alt="Matt Hagger" />
        <div class="text">
            <h2>About Me</h2>
            <p>
                Hi! My name is Matt. I'm a student at WPI studying Computer Science and Game Development with a lifelong passion for art.
                <br/><br/>
                I mainly focus on urban sketching with pen and watercolour, and woodturning. I also enjoy making digital art and 3D modeling.
                <br/><br/>
                I hope you enjoy my art!
            </p>
            <br />

        </div>
    </div>
</template>
<script lang="ts">
    import { defineComponent } from "vue";
    export default defineComponent({
        name: "AboutView",
    });
</script>
<style lang="scss">
    @use "@/assets/style.scss" as app;

    .about {
        width: 100%;
        padding: 10px;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: flex-start;
        gap: 10%;

        @media (max-width: 1024px) {
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        img {
            width: 40%;
            aspect-ratio: 1/ 1.618; 
            border-radius: 30px 0 30px 0;
            object-fit: cover;

            @media (max-width: 1024px) {
                width: 100%;
                aspect-ratio: 1/1;
            }
        }

        .text {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            gap: 20px;

            h2 {
                font-size: 2rem;
            }

            p {
                font-size: 1.2rem;
            }
        }
    }
</style>
