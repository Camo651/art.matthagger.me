<template>
    <div class="app">
        <header>
            <aside>
                <h1>Matt Hagger Art</h1>
                <br />
                <h2>Wood | Ink | Watercolor</h2>
            </aside>
            <nav>
                <router-link to="/">My Work</router-link>
                <router-link to="/about">About Me</router-link>
                <a href="https://matthagger.me" target="_blank">Main Portfolio</a>
                <SocialsButtons />
            </nav>
        </header>
        <main>
            <hr />
            <router-view />
        </main>
        <footer>
            <hr />
            <p>© {{getYear()}} Matt Hagger Art</p>
            <SocialsButtons />
        </footer>
    </div>
</template>
<script lang="ts">
    import SocialsButtons from "@/components/SocialsButtons.vue";
    export default {
        name: "App",
        components: {
            SocialsButtons,
        },
        methods: {
            getYear() {
                return new Date().getFullYear();
            },
        },
    }
</script>
<style lang="scss">
    @use "@/assets/style.scss" as app;

    .app {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        width: 100%;
        min-height: 100vh;
    }

    header {
        width: app.$page-width;
        display: flex;
        justify-content: space-evenly;
        align-items: flex-start;
        padding: 70px 0;

        @media (max-width: 1024px) {
            flex-direction: column-reverse;
            align-items: center;
            gap: 20px;
        }

        aside {
            width: 80%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;

            @media (max-width: 1024px) {
                align-items: center;
                width: 100%;
                text-align: center;
            }

        }
        nav {
            width: 20%;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            justify-content: center;
            gap: 20px;

            @media (max-width: 1024px) {
                flex-direction: row;
                width: 100%;
                justify-content: space-evenly;
            }

            a {
                text-decoration: none;
                font-size: 1.5rem;
                font-weight: bold;
                transition: color 0.3s;

                &:hover {
                    color: app.$txt-link;
                }
            }
        }
    }
    main {
        width: app.$page-width;
        margin: 0 auto;

        hr {
            width: 10%;
            margin-bottom: 20px;
            border: 1px solid app.$txt-tertiary;
        }
    }
    footer {
        width: app.$page-width;
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        flex-wrap: wrap;
        padding: 60px 0 20px 0;

        hr {
            width: 100%;
            border: 1px solid app.$txt-tertiary;
        }
    }
</style>
