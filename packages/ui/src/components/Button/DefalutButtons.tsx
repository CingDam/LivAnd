import clsx from "clsx";

type ButtonProps = {
    children: React.ReactNode;
    size?: "sm" | "md" | "lg";
    type?: "button" | "submit" | "reset";
    className?: string;
    onClick?: () => void;
    disabled?: boolean;
}

export function DefaultButtons({
    children,
    size = "md",
    type = "button",
    className,
    onClick,
    disabled
}:ButtonProps) {

    const base = "bg-[#FF6767] text-white border border-[#FF6767]"

    const hover = 'hover:bg-white hover:text-[#FF6767] hover:border-[1px] hover:border-[#FF6767] transition-all duration-200 ease-in-out'

    const sizes = {
        sm: "text-sm px-4 py-1",
        md: "text-base px-16 py-3",
        lg: "text-lg"
    }

    return(
        <button
            type={type}
            onClick={onClick}
            disabled={disabled}
            className={clsx(base, hover, sizes[size], className)}
        >{children}</button>
    )
}