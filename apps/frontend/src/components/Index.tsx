"use client"

import React, { useEffect, useState } from 'react'
import { clsx } from 'clsx';
import { CardLg, CardSm } from "@repo/ui";

const Index = () => {
    // 슬라이드 state
    const [activeIndex, setActiveIndex] = useState(0);

    const numArr = [1,2,3,4];
    const titleArr = ["소프트 스트라이프 와이드카라 블라우스","크림무드 새틴 블라우스","코지블루 루즈핏 셔츠","퓨어라인 화이트 셔츠 원피스"];
    const tagArr = [
        ["#프렌치무드","#산뜻한데일리"],
        ["#심플무드","#세미정장"],
        ["#청량한무드","#소프트핏"],
        ["#클래식무드","#여신핏"],
    ]
    const priceArr = ["31,500","39,950","27,300","47,200"]
    const saleArr = ["25%","15%","30%","20%"]

    const colorArr = [
        {
            border:["border-[#D5DCE6]"],
            background:["bg-[#E4E9F1]"]
        },
        {
            border:["border-[#E3DED4]"],
            background:["bg-[#F1EDE6]"]
        },
        {
            border:["border-[#D8E4F0]"],
            background:["bg-[#E6F0F8]"]
        },
        {
            border:["border-[#E0E0E0]"],
            background:["bg-[#F8F8F8]"]
        },
    ]
    
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
                    {numArr.map((item,index) => <CardSm
                        key={index}
                        tumbnail={`product/top/blouse-shirt/product${item}/thumbnail.jpg`} 
                        title={titleArr[index]}
                        tag={tagArr[index]}
                        price={priceArr[index]}
                        sale={saleArr[index]}
                        color={colorArr[index]}
                    />)}
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