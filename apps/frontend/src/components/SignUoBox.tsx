import React from 'react'

const SignUoBox = () => {
  return (
    <div className='border-[1px] border-[#FFB3B3] h-[86%] w-[56%] mx-auto mt-[10%]'>
        <div>
            <div>이메일</div>
            <input/>@<input/>
        </div>
        <div>
            <div>비밀번호</div>
            <input type='password'/>
            <div>비밀번호는 8~20자, 영문+숫자 및 특수문자를 포함해야 합니다.</div>
        </div>
        <div>
            <div>비밀번호 확인</div>
            <input type='password'/>
        </div>
        <div>
            <div>성명</div>
            <input/>
        </div>
        <div>
            <div>핸드폰 번호</div>
            <div>010<span>-</span><input/><span>-</span><input/></div>
        </div>
    </div>
  )
}

export default SignUoBox