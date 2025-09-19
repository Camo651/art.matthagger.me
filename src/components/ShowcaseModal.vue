<template>
    <div class="bkg" @click="$emit('close')">
        <div class="modal" @click.stop>
            <nav>
                <div class="title">
                    <h1>{{ item.title }}</h1>
                    <p>{{ item.medium }}</p>
                </div>
                <button @click="$emit('close')">X</button>
            </nav>
            <img :src="item.src" :alt="item.title" />
            <hr v-if="item.elements && item.elements.length" />
            <div class="elements" v-for="(element, index) in item.elements" :key="item.id+'element'+index">
                <h3 class="element title" v-if="element.title">{{ element.title }}</h3>
                <p class="element text" v-if="element.text">{{ element.text }}</p>
                <img class="element image" v-if="element.img" :src="element.img" :alt="element.caption" />
                <p class="element caption" v-if="element.caption">{{ element.caption }}</p>
            </div>
        </div>
    </div>
</template>
<script lang="ts">
    import { defineComponent } from "vue";
    export default defineComponent({
        name: "ShowcaseModal",
        props: {
            item: {
                type: Object,
                required: true
            }
        },
        mounted() {
            window.addEventListener("keydown", this.closeOnEsc);
        },
        beforeUnmount() {
            window.removeEventListener("keydown", this.closeOnEsc);
        },
        methods: {
            closeOnEsc(event: KeyboardEvent) {
                if (event.key === "Escape") {
                    this.$emit("close");
                }
            }
        }
    });
</script>
<style lang="scss">
    @use "@/assets/style.scss" as app;
    .bkg {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        backdrop-filter: blur(10px);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1000;
        cursor: pointer;

        .modal {
            overflow: scroll;
            width: app.$page-width;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            padding: 40px;
            z-index: 1001;
            cursor: auto;
            height: 80vh;
            scrollbar-width: none;
            -ms-overflow-style: none;
            &::-webkit-scrollbar {
                display: none;
            }
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            gap: 10px;

            @media (max-width: 1024px) {
                width: 90%;
            }

            nav {
                width: 80%;
                display: flex;
                justify-content: space-between;
                align-items: center;

                button {
                    border-radius: 50%;
                    aspect-ratio: 1 / 1;
                }

                @media (max-width: 1024px) {
                    width: 100%;
                    
                    h1 {
                        font-size: 1.8rem;
                        text-wrap: wrap;
                        line-break: loose;
                    }
                }

            }

            img {
                width: 80%;
                max-height: 80%;
                padding: 10px;
                object-fit: contain;

                @media (max-width: 1024px) {
                    width: 100%;
                }
            }

            .elements {
                width: 80%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                gap: 10px;

                .element {
                    width: 100%;
                    text-align: center;
                }

                .title {
                    font-size: 1.8rem;
                    font-weight: bold;
                    text-align: left;
                }

                .text {
                    font-size: 1.2rem;
                    text-align: left;
                }

                .image {
                    width: 80%;
                    max-height: 80%;
                    object-fit: contain;

                    @media (max-width: 1024px) {
                        width: 100%;
                    }
                }

                .caption {
                    font-size: 1rem;
                }


            }

        }
    }
</style>