"use client"

import React, { useState } from 'react'
import { LoginButton } from '@repo/ui'
import { Check } from 'react-coolicons'
import { useRouter } from 'next/navigation'

const LoginBox = () => {

    const [checked, setChecked] = useState(false);
    const nav = useRouter();

    const signup = () => {
        nav.push("../signup")
    }

  return (
    <div className="border-[1px] border-[#FFB3B3] h-[55%] w-[56%] mx-auto mt-[10%]">
        <div className="flex flex-col flex-wrap justify-center content-center mt-[13%]">
            <div className='w-auto my-auto block'>
                <div className=''>
                    <div className="font-bold">이메일</div>
                    <input
                        className="mt-[10px] border-[0.5px] outline-none border-[#989898] w-full px-2 py-1"
                    />
                </div>
                <div>
                    <div className="font-bold mt-8">비밀번호</div>
                    <input
                        className="mt-[10px] border-[0.5px] outline-none border-[#989898] w-full px-2 py-1"
                        type='password'
                    />
                </div>
                <div className="flex mt-3">
                    <label className="flex items-center cursor-pointer">
                        <input type="checkbox" checked={checked} className="peer hidden" onChange={(e) => setChecked(e.target.checked)}/>
                        <div className="w-4 h-4 border border-red-300 cursor-pointer flex items-center justify-center peer-checked:bg-red-300">
                            {checked && <Check className="peer-checked:block w-4 h-4 text-white" />}
                        </div>
                        <span className="font-light ml-2">자동로그인</span>
                    </label>
                    <div className='flex space-x-4 font-bold ml-[28.5%]'>
                        <span className="text-gray-400 cursor-pointer">아이디 찾기</span>
                        <span className="text-gray-400 cursor-pointer">비밀번호 재설정</span>
                    </div>
                </div>
            </div>
            <LoginButton className="mt-10 w-[70%] mx-auto block">로그인</LoginButton>
            <div className='text-gray-400 font-bold mx-auto mt-3'>
                계정이 없으신가요? <span className='text-black ml-3 cursor-pointer' onClick={signup}>회원가입 하러가기</span>
            </div>
        </div>
    </div>
  )
}

export default LoginBox