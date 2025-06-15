"use client"

import api from '@/config/api.config';
import { useRouter, useSearchParams } from 'next/navigation'
import React, { useEffect } from 'react'

const KaKaoCallback = () => {

    const params = useSearchParams();
    const router = useRouter();

    useEffect(()=>{

        // kakao Api 코드값
        const code = params.get('code');

        // 서버에서 생성된 state값
        const state = params.get('state');

        if( code && state ) {
            api.post("/auth/kakao/callback",{code, state})
            .then((res) => {
                alert("로그인 성공");
                router.replace("/");
            })
            .catch((err) => {
                alert(`로그인 실패! : ${err}`)
                router.replace("/login")
            })
        }
    },[params])
    
    return (
        <div className="flex justify-center items-center h-screen">
            <div className="w-8 h-8 border-4 border-gray-300 border-t-green-500 rounded-full animate-spin"></div>
            <p className="text-gray-500 animate-pulse">카카오 로그인 처리 중입니다...</p>
        </div>
    )
}

export default KaKaoCallback