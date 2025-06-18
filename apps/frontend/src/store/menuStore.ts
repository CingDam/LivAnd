import { create } from "zustand";

interface menuState {
    isMenuOpen: boolean;
    toggleMenu: () => void;
    closeMenu: () => void;
}

export const useMenuStore = create<menuState>((set) => ({
    isMenuOpen: false,
    toggleMenu: () => set((state) => ({isMenuOpen: !state.isMenuOpen})),
    closeMenu: () => set({isMenuOpen: false})
}))