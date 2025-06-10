import React from 'react'

const SocialLogin = () => {
  return (
    <div>
        <div className='flex justify-center items-center gap-4 mt-6'>
            {/* 카카오 로그인 */}
            <button className="w-12 h-12 rounded-full bg-[#FEE500] flex items-center justify-center shadow-md hover:scale-105 transition">
                <img src="/svg/kakao.svg" alt="카카오 로그인" className="w-12 h-12" />
            </button>

            {/* 네이버 로그인 */}
            <button className="w-12 h-12 rounded-full bg-[#03C75A] flex items-center justify-center shadow-md hover:scale-105 transition">
                <img src="/svg/naver.svg" alt="네이버 로그인" className="w-12 h-12" />
            </button>
        </div>
    </div>
  )
}

export default SocialLogin