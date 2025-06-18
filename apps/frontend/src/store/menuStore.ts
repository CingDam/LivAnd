import { create } from "zustand";

interface menuState {
    ieMenuOpen: boolean;
    toggleMenu: () => void;
    closeMenu: () => void;
}

export const useMenuStore = create<menuState>((set) => ({
    ieMenuOpen: false,
    toggleMenu: () => set((state) => ({ieMenuOpen: !state.ieMenuOpen})),
    closeMenu: () => set({ieMenuOpen: false})
}))