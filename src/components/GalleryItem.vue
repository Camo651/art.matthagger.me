<template>
    <div class="gallery-grid-item">
        <img :src="src" alt="Gallery item" @click="$emit('showcase', id)" />
        <p>{{ title }}</p>
        <div v-if="editMode">
            <button @click="$emit('moveup', id)">&lt;- </button>
            <button @click="$emit('movedown', id)"> -&gt;</button>
            <button @click="$emit(hidden? 'show' : 'hide', id)">{{ hidden? 'Show' : 'Hide' }}</button>
        </div>
    </div>
</template>
<script lang="ts">
import { defineComponent } from "vue";
export default defineComponent({
    name: "GalleryItem",
    props: {
        id: {
            type: Number,
            required: true
        },
        src: {
            type: String,
            required: true
        },
        title: {
            type: String,
            required: true
        },
        editMode: {
            type: Boolean,
            required: false,
            default: false
        },
        hidden: {
            type: Boolean,
            required: false,
            default: false
        }
    },
});
</script>
<style lang="scss">
    .gallery-grid-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 30%;
        @media (max-width: 1024px) {
            width: 45%;
        }
        @media (max-width: 768px) {
            width: 90%;
        }

        img {
            position: relative;
            width: 100%;
            height: auto;
            overflow: hidden;
            aspect-ratio: 1 / 1;
            object-fit: contain;
            cursor: pointer;
            transition: all 0.3s, transform 0.3s;
            filter: contrast(1) brightness(1);
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);

            &:hover {
                filter: contrast(1.2) brightness(1.1);
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.75);
                transform: translateY(-5px) scale(1.01);
            }
        }

        p {
            padding: 10px 0;
            text-align: center;
        }
    }
</style>