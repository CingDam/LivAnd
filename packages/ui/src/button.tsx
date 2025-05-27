import clsx from "clsx";
import React from "react";

type ButtonProps = {
    children: React.ReactNode;
    variant?: "primary";
    className?: string;
    size?: "md";
    onClick?: () => void;
    disabled?: boolean;
};

export function Button({
    children,
    variant = "primary",
    size = "md",
    className,
    onClick,
    disabled
}: ButtonProps) {
    const base = 'justify-center items-center';
    const variants = {
        primary: "bg-[#FF6767] text-white"
    }
    const sizes = {
        md: "text-base px-33 py-2"
    }

    return(
        <button onClick={onClick} className={clsx(base,variants[variant], sizes[size], className)}>
            {children}
        </button>
    )
}