"use client"

import { useMenuStore } from '@/store/menuStore'
import Link from 'next/link';
import React from 'react'

const Menu = () => {

    const {isMenuOpen, closeMenu} = useMenuStore();

    if(!isMenuOpen) return null;
    return (
        <>
            {
                isMenuOpen && (
                <div className="fixed inset-0 z-40 flex justify-center">
                    <div className='absolute w-full max-w-[64rem] h-full'>
                        <div className='absolute inset-0 bg-black/40' onClick={closeMenu} />
                        <aside
                            className='relative flex flex-col w-[265px] top-0 left-0 h-full bg-white left-0 pt-[55px] px-4'
                        >
                            <div>
                                <p className='text-xl font-medium mt-5'>상의</p>
                                <hr className='w-[225px]'></hr>
                                <ul className='mt-4 space-y-3 list-disc px-5'>
                                    <li><Link href={"products/blouse-shirt"}>블라우스 / 셔츠</Link></li>
                                    <li><Link href={"products/outer"}>아우터</Link></li>
                                    <li><Link href={"products/knit-cardigan"}>니트 / 가디건</Link></li>
                                    <li><Link href={"products/tshirt"}>티셔츠</Link></li>
                                    <li><Link href={"products/onepiece"}>원피스</Link></li>
                                </ul>
                            </div>
                            <div>
                                <p className='text-xl font-medium mt-6'>하의</p>
                                <hr></hr>
                                <ul className='mt-4 space-y-3 list-disc px-5'>
                                    <li><Link href={"products/skirt"}>스커트</Link></li>
                                    <li><Link href={"products/pants"}>팬츠</Link></li>
                                </ul>
                            </div>
                            <div>
                                <p className='text-xl font-medium mt-6'>악세서리</p>
                                <hr></hr>
                                <ul className='mt-4 space-y-3 list-disc px-5'>
                                    <li><Link href={"products/necklace"}>목걸이</Link></li>
                                    <li><Link href={"products/bracelet"}>팔찌</Link></li>
                                    <li><Link href={"products/ring"}>반지</Link></li>
                                </ul>
                            </div>
                        </aside>
                    </div>

                </div>
                )
            }
        </>
    )
}

export default Menu