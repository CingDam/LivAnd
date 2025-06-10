"use client"

import React, { useEffect, useState } from 'react'
import { clsx } from 'clsx';
import { CardLg, CardSm } from "@repo/ui";

const Index = () => {
    // 슬라이드 state
    const [activeIndex, setActiveIndex] = useState(0);
    
    useEffect(() => {
        // setInterval은 반복실행
        const interval = setInterval(() => {
            setActiveIndex(prev => (prev + 1) % tabMenuTitle.length)
        },2000);


        // 컴포넌트 언마운트시 초기화 시키는 함수
        return () => clearInterval(interval);
    }, [])

    const tabMenuTitle = ['상의/블라우스','원피스','바지','스커트','아우터','악세서리']

    return (
        <div>
            <div className="w-[95%] h-[480px] mt-3 mx-auto">
                <img className="w-full h-full object-cover object-[center_top] cursor-pointer rounded" src="/banner/banner01.png"></img>
            </div>
            <ul className="flex space-x-6 justify-center mt-6">
                {tabMenuTitle.map((item,index) => (
                    <li key={index} className="flex flex-col items-center cursor-pointer transition-all duration-300 hover:drop-shadow-md">
                        <img src={`/tab-menu/icon${index+1}.png`}/>
                        <p className="text-xs mt-2">{item}</p>
                    </li>
                ))}
            </ul>
            <div className="mt-[71px]">
                <div className="text-center text-2xl font-semibold">BEST ITEM</div>
                <ul className="flex w-fit max-w-full mx-auto bg-[#FFF2F2] rounded-full overflow-hidden mt-3">
                    {tabMenuTitle.map((item,index) => (<li key={index} 
                        onClick={() => setActiveIndex(index)}
                        className={clsx(
                        "px-10 py-1 text-sm cursor-pointer transition-all duration-300",
                        index === activeIndex
                        ? "bg-[#FFB5B5] text-black font-bold drop-shadow-md rounded-full"
                        : "text-[#C2C2C2]"
                    )}>{item}</li>))}
                </ul>
                <div className='flex mt-9 space-x-6 justify-center'>
                    <CardSm/>
                    <CardSm/>
                    <CardSm/>
                    <CardSm/>
                </div>
            </div>
            <div className="my-[77px]">
                <div>
                    <div className="text-center text-2xl font-semibold">NEW ARRIVALS</div>
                    <div className="text-center text-md font-light mt-3">오늘 들어온 상품을 확인해보세요</div>
                </div>
                <div className="flex flex-col items-center mt-8 space-y-12">
                    <div className='flex space-x-10'>
                        <CardLg/>
                        <CardLg/>
                        <CardLg/>
                    </div>
                    <div className='flex space-x-10'>
                        <CardLg/>
                        <CardLg/>
                        <CardLg/>
                    </div>
                    <div className='flex space-x-10'>
                        <CardLg/>
                        <CardLg/>
                        <CardLg/>
                    </div>
                    <div className='flex space-x-10'>
                        <CardLg/>
                        <CardLg/>
                        <CardLg/>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Index