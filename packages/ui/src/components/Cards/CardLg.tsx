import { StarIcon } from "@heroicons/react/16/solid";

type ImageProps = {
    tumbnail?: string
    className?: string;
    tag?:[];
    price:string;
    sale:string;
    title?:string;
    color?:{};
    onClick?: () => void;
}

export function CardLg({
    tumbnail = "https://placehold.co/285x405?text=No+Image",
    tag = ["#TESTTAG","테스트태그"],
    title = "테스트 의상",
    color = {
        border: ["border-[#C8BEB5]","border-[#C8BEB5]","border-[#C8BEB5]"],
        background: ["bg-[#D4CAC1]","bg-[#D4CAC1]","bg-[#D4CAC1]"]
    },
    price = "00,000",
    sale = "99%"
}) {
    return (
        <>
            <div className="group cursor-pointer">
                <div className="w-[285px] h-[405px] overflow-hidden">
                    <img src={tumbnail} alt="placeholder" className="w-full h-full object-cover object-[center_top] transition:transform duration-300 group-hover:scale-105"/>
                </div>
                <div className="text-xs space-x-1 my-2">{tag.map((item,index)=><span>{item}</span>)}</div>
                <div>
                    <p className="text-xl">{title}</p>
                    <div className="mt-2"><span className="font-extrabold text-xl">{price}</span><span className="ml-1 text-md font-bold text-[#FFA8A8]">{sale}</span></div>
                    <ul className="flex space-x-1 mt-5">
                        {color.border.map((_,i)=> <li className={`border-[1px] ${color.border[i]} ${color.background[i]} w-6 h-2`}></li>)}
                    </ul>
                    <div className="flex mt-3 text-[#BDBDBD] space-x-1">
                        <StarIcon className="w-5 h-5 text-[#BDBDBD]"/>
                        <div>0<span>(0)</span></div>
                    </div>
                </div>
            </div>
        </>
    )
}  