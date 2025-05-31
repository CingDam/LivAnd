import clsx from "clsx";
import React from "react";

type LoginButtonProps = {
    children: React.ReactNode;
    onClick?: () => void;
    className?: string;
    disabled?: boolean;
};

export function LoginButton({
    children,
    onClick,
    className,
    disabled
}: LoginButtonProps) {
    const base = 'inline-flex justify-center items-center border border-[#FF6767] text-white bg-[#FF6767] text-base px-[135px] py-2';
    const hover = 'hover:bg-white hover:text-[#FF6767] hover:border hover:border-[#FF6767] transition-all duration-200 ease-in-out'

    return (
        <button
            onClick={onClick}
            disabled={disabled}
            className={clsx(base, hover, className)}
        >
            {children}
        </button>
    );
}