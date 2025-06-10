
'use client'
import { useRouter } from 'next/navigation';
import React from 'react'
import { HamburgerMd, Heart02, ShoppingCart01, UserSquare } from 'react-coolicons';
import { SearchBar } from '@repo/ui';

const Header = () => {

    const nav = useRouter();

    const tologin = () => {
        nav.push('./login');
    }


    return (
        <div className='flex justify-center item-center fixed w-[64rem] bg-white h=[55px] z-10'>
            <HamburgerMd className="w-10 h-10 cursor-pointer ml-[25px]" />
            <span
                className='font-[Sunshiney] text-4xl cursor-pointer ml-[38px]'
                onClick={()=>nav.replace('/')}
            >
                Liv&
            </span>
            <SearchBar/>
            <div className='flex py-[5px]'>
                <Heart02 className='w-8 h-8 cursor-pointer'/>
                <ShoppingCart01 className='w-8 h-8 cursor-pointer mx-[12px]'/>
                <UserSquare className='w-8 h-8 cursor-pointer' onClick={tologin}/>
            </div>
        </div>
    )
}

export default Header