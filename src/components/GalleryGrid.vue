<template>
    <div class="gallery-grid">
        <GalleryItem 
            v-for="item in getGallery()"

            :key="item.id"
            :id="item.id"
            :src="item.src"
            :title="item.title"
            :editMode="editMode"
            :hidden="item.tags.includes('hide')"

            @showcase="openShowcase"
            @moveup="moveItem(item.id, -1)"
            @movedown="moveItem(item.id, 1)"
            @show="setitemHidden(item.id, false)"
            @hide="setitemHidden(item.id, true)"
        />
        <div v-if="editMode" style="width: 100%; display: flex; justify-content: center; background-color: #00ff00; padding: 10px;">
            <button @click="saveChanges">Save changes</button>
        </div>
        <Transition name="fade">
            <ShowcaseModal v-if="showcaseId !== null" @close="showcaseId = null" :item="gallery[showcaseId]"/>
        </Transition>
    </div>
</template>
<script lang="ts">
import { defineComponent } from "vue";
import ShowcaseModal from "./ShowcaseModal.vue";
import GalleryItem from "./GalleryItem.vue";

// gallery item interface
interface GalleryItemType {
    id: number;
    src: string;
    title: string;
    medium: string;
    elements?: ShowcaseElement[];
    tags: string[];
}
interface ShowcaseElement {
    title?: string;
    text?: string;
    img?: string;
    caption?: string;
}

export default defineComponent({
    name: "GalleryGrid",
    components: {
        ShowcaseModal,
        GalleryItem,
    },
    data() {
        return {
            showcaseId: null as number | null,
            gallery:  [] as GalleryItemType[],
            editMode: false,
        };
    },
    methods: {
        openShowcase(id: number) {
            this.showcaseId = id;
        },
        getGallery(): GalleryItemType[] {
            for (let i = 0; i < this.gallery.length; i++) {
                this.gallery[i].id = i;
            }
            return this.gallery;
        },
        getMainStyle() {
            // prevent scroll when modal is open
            document.body.style.overflow = this.showcaseId !== null ? "hidden" : "";
        },
        moveItem(index: number, direction: 1 | -1) {
            const newIndex = index + direction;
            if (newIndex < 0 || newIndex >= this.gallery.length) {
                return;
            }
            const temp = this.gallery[index];
            this.gallery[index] = this.gallery[newIndex];
            this.gallery[newIndex] = temp;
        },
        setitemHidden(id: number, hidden: boolean) {
            this.gallery[id].tags = hidden ? this.gallery[id].tags.concat("hide") : this.gallery[id].tags.filter((tag) => tag !== "hide");
        },
        fetchGallery() {
            const GALLERY_URL = "/items.json";
            fetch(GALLERY_URL)
                .then((response) => response.json())
                .then((data) => {
                    if (this.editMode) {
                        this.gallery = data;
                        return;
                    }
                    this.gallery = data.filter((item: GalleryItemType) => !item.tags.includes("hide"));
                });
        },
        saveChanges() {
            // stringify the gallery data and save it as a JSON file to download
            const dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(this.gallery, null, 2));
            const downloadAnchorNode = document.createElement("a");
            downloadAnchorNode.setAttribute("href", dataStr);
            downloadAnchorNode.setAttribute("download", "items.json");
            document.body.appendChild(downloadAnchorNode); // required for firefox
            downloadAnchorNode.click();
            downloadAnchorNode.remove();

        }
    },
    watch: {
        showcaseId() {
            this.getMainStyle();
        },
    },
    mounted() {
        this.fetchGallery();
        setInterval(() => {
            const e = document.body.classList.contains("edit-mode");
            if (e !== this.editMode) {
                this.editMode = e;
                this.fetchGallery();
            }
        }, 3000);
    }
});
</script>
<style lang="scss">
    .gallery-grid {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-evenly;
        align-items: flex-start;
        gap: 10px;
        width: 100%;
    }

    .fade-enter-active, .fade-leave-active {
        transition: all 0.2s;
    }
    .fade-enter-from, .fade-leave-to {
        opacity: 0;
    }
    .fade-enter-to, .fade-leave {
        opacity: 1;
    }
    
</style>