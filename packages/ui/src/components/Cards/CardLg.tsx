import { StarIcon } from "@heroicons/react/16/solid";

export function CardLg() {
    return (
        <>
            <div className="cursor-pointer">
                <img src="https://placehold.co/285x405?text=No+Image" alt="placeholder" />
                <div className="text-xs space-x-1 my-2"><span>#TESTTAG</span><span>#테스트태그</span></div>
                <div>
                    <p className="text-xl">테스트 의상</p>
                    <div className="mt-2"><span className="font-extrabold text-xl">00,000</span><span className="ml-1 text-md font-bold text-[#FFA8A8]">99%</span></div>
                    <ul className="flex space-x-1 mt-5">
                        <li className="border-[1px] border-[#C8BEB5] bg-[#D4CAC1] w-6 h-2"></li>
                        <li className="border-[1px] border-[#C8BEB5] bg-[#D4CAC1] w-6 h-2"></li>
                        <li className="border-[1px] border-[#C8BEB5] bg-[#D4CAC1] w-6 h-2"></li>
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