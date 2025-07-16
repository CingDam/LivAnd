
'use client'
import { useRouter } from 'next/navigation';
import React, { useEffect, useState } from 'react'
import { HamburgerMd, Heart02, ShoppingCart01, UserSquare } from 'react-coolicons';
import { SearchBar } from '@repo/ui';
import { useMenuStore } from '@/store/menuStore';
import { useUserStore } from '@/store/userStore';
import api from '@/config/api.config';

const Header = () => {

    const nav = useRouter();
    const toggleMenu = useMenuStore((state) => state.toggleMenu);
    const user = useUserStore((state) => state.user);
    const setUser = useUserStore((state) => state.setUser);

    useEffect(()=>{
        api.get("/auth/me",{
            withCredentials:true
        }).then(
            res => {
                if(res.data.loggedIn) {
                    setUser(res.data.user);
                }
            }
        ).catch(err => console.error(err));
    },[])

    console.log("유저 정보 :",user);

    const handleFunction = () => {
        if (user) {
            nav.push("/my-page");
        } else {
            nav.push("/login")
        }
    }


    return (
        <div className='flex justify-center item-center fixed w-[64rem] bg-white h=[55px] z-50'>
            <HamburgerMd className="w-10 h-10 cursor-pointer ml-[25px]" onClick={toggleMenu}/>
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
                <UserSquare className='w-8 h-8 cursor-pointer' onClick={handleFunction}/>
            </div>
        </div>
    )
}

export default Header