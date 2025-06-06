'use client'

import React, { useRef, useState } from 'react'
import { DefaultButtons, SignUpButton } from '@repo/ui';
import { ArrowLeftSm } from 'react-coolicons';
import { useRouter } from 'next/navigation';
import { clsx } from 'clsx';
import api from '@/config/api.config';


const SignUpBox = () => {
    // state 영역
    const [send,setSend] = useState(false);
    // String타입만 들어오게
    // 이메일 state
    const [emailId,setEmailId] = useState<string>("");
    const [emailAdd,setEmailAdd] = useState<string>("");
    const [emailChkValue, setEmailChkValue] = useState<string>("");

    // 비밀번호 state
    const [pwd,setPwd] = useState<string>("");
    const [confirmPwd,setConfirmPwd] = useState<string>("");

    // 이름 state
    const [name,setName] = useState<string>("");

    // 전화번호 state
    const [phonePrefix,setPhonePrefix] = useState<string>("010");
    const [phoneMiddle,setPhoneMiddle] = useState<string>("");
    const [phoneLast,setPhoneLast] = useState<string>("");

    // 검증 state
    const [isAddressValid, setIsAddressValid] = useState<boolean>(false);
    const [validateValue, setValidateValue] = useState<string>("");
    const [isPwdValid,setIsPwdValid] = useState<boolean | null>(null); // 비밀번호 검증식 확인
    const [pwdMatch, setPwdMatch] = useState<boolean | null>(null); // 비밀번호 일치 확인
    const [isEmailValidate, setIsEmailValidate] = useState<boolean>(false);

    // ref 영역
    const emailIdRef = useRef<HTMLInputElement>(null);
    const emailAddRef = useRef<HTMLInputElement>(null);
    const emailValidateRef = useRef<HTMLInputElement>(null);
    const pwdRef = useRef<HTMLInputElement>(null);
    const confirmPwdRef = useRef<HTMLInputElement>(null);
    const nameRef = useRef<HTMLInputElement>(null);
    const phoneMidRef = useRef<HTMLInputElement>(null);
    const phoneLastRef = useRef<HTMLInputElement>(null);

    const nav = useRouter();

    const userBody = {
        user_email: `${emailId}@${emailAdd}`,
        user_pwd: pwd,
        user_nickname: name,
        user_phone: `${phonePrefix}-${phoneMiddle}-${phoneLast}`
    }

    const toback = () => {
        nav.replace("/login");
    }


    // 이메일 주소 정규식 확인 함수
    const emailRegexCheck = (value: string) => {
        const domainRegex = /^[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$/;

        setEmailAdd(value);

        if(domainRegex.test(emailAdd)) {
            setIsAddressValid(true);
        }
    }

    // 인증번호 전송 함수
    const sendEmail = () => {
        setSend(true);
        api.post('/auth/send-email',{
            to: userBody.user_email,
        }).then(res => {
            console.log(res);
            setValidateValue(res.data.value);
        }).catch(
            err => console.error(err)
        )
    }

    // 인증번호 검증 함수
    const emailValidate = (value: string) => {
        setEmailChkValue(value);
        if(validateValue === emailChkValue) {
            setIsEmailValidate(true);
        } else {
            setIsEmailValidate(false);
        }
    }

    // 비밀번호 정규식 확인 함수
    const pwdRegexCheck = (value: string) => {
        const pwdRegex =
            /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+[\]{};:'",.<>/?\\|`~])[A-Za-z\d!@#$%^&*()\-_=+[\]{};:'",.<>/?\\|`~]{8,20}$/;
        
        setPwd(value);
        if (value === "") {
          setIsPwdValid(null);  
        } else if(pwdRegex.test(value)) {
            setIsPwdValid(true);
        } else {
            setIsPwdValid(false);
        }
    }

    // 비밀번호 일치 확인 함수
    const pwdMatchCheck = (value: string) => {
        setConfirmPwd(value);

        if (value === "") {
          setPwdMatch(null);  
        } else if(value === pwd) {
            setPwdMatch(true);
        } else {
            setPwdMatch(false);
        }
    }

    // 회원가입 폼 빈값 체크 함수
    const validateForm = () => {
        if(emailId == "") {
            alert("이메일 아이디를 입력해주세요.");
            emailIdRef.current?.focus();
            return false;
        }

        if(emailAdd == "") {
            alert("이메일 주소를 입력해주세요.");
            emailAddRef.current?.focus();
            return false;
        }

        if(isAddressValid === false) {
            alert("올바른 주소 형식을 입력해주세요! ex) naver.com");
            emailAddRef.current?.focus();
            return false;
        }

        if (send === false) {
            alert("이메일 인증을 해주세요!")
            emailAddRef.current?.focus();
            return false;
        }

        if(emailChkValue == "") {
            alert("인증번호를 입력해주세요!")
            emailValidateRef.current?.focus();
            return false;
        }

        if(isEmailValidate === false) {
            alert("인증번호가 맞지 않습니다!")
            emailValidateRef.current?.focus();
            return false;
        }

        if(pwd == "") {
            alert("비밀번호를 입력해주세요.");
            pwdRef.current?.focus();
            return false;
        }

        if(pwdMatch === false || pwdMatch === null) {
            alert("비밀번호가 일치하지 않습니다!");
            confirmPwdRef.current?.focus();
            return false;
        }

        if(name == "") {
            alert("이름을 입력해주세요.");
            nameRef.current?.focus();
            return false;
        }

        if(phoneMiddle == "" || phoneLast == "") {
            alert("핸드폰 번호를 정확히 입력해주세요!");
            phoneMidRef.current?.focus();
            return false;
        }

        return true;
    }

    // 입력 필드 및 조건 초기화 함수
    const resetField = () => {
        setEmailId("");
        setEmailAdd("");
        setEmailChkValue("");
        setPwd("");
        setConfirmPwd("");
        setName("");
        setPhonePrefix("010");
        setPhoneMiddle("");
        setPhonePrefix("");
        setIsAddressValid(false);
        setIsEmailValidate(false);
        setIsPwdValid(false);
    }

    // 회원가입 통신
    const handleSubmit = () => {
        if(!validateForm()) return;

        console.log("입력된 데이터 : ", userBody );

        api.post("/user", userBody)
        .then(res => {
            if(res.data.success === true) {
                alert("회원가입에 성공했습니다!");
                resetField();
                nav.replace("/login");
            } else {
                resetField();
            }
        }).catch(err => console.error(err));
    }


    return (
        <form className='relative border-[1px] border-[#FFB3B3] h-[90%] w-[56%] mx-auto mt-[3%] flex flex-col'>
            <div className='absolute top-[3%] left-[3%] flex cursor-pointer font-bold' onClick={toback}><ArrowLeftSm/> 돌아가기</div>
            <div className='w-[69%] m-auto'>
                <div className="space-y-1">
                    <div className='font-bold'>이메일</div>
                    <div className='flex space-x-2 items-center'>
                        <input className='max-w-[135px] py-0.5 outline-none border-[1px] border-[#989898] px-2' 
                                value={emailId} onChange={e => setEmailId(e.target.value)}
                                ref={emailIdRef}
                        />
                        <span className='font-bold'>@</span>
                        <input className='max-w-[135px] py-0.5 outline-none border-[1px] border-[#989898] px-2' 
                                value={emailAdd} onChange={e => emailRegexCheck(e.target.value)}
                                ref={emailAddRef}
                        />
                        <DefaultButtons size="sm" className="font-regular" onClick={sendEmail}>전송하기</DefaultButtons>
                    </div>
                </div>
                <div className={clsx(
                    "space-y-1 overflow-hidden transition-all duration-1300",
                    send ? "opacity-1 max-h-[160px] my-7" : "opacity-0 max-h-0"
                )}>
                    <div className='font-bold'>인증번호</div>
                    <div className='flex space-x-2'>
                        <input className='w-[76.8%] py-0.5 outline-none border-[1px] border-[#989898] px-2'
                            value = {emailChkValue} onChange={e => setEmailChkValue(e.target.value)}
                            ref={emailValidateRef}
                        /> 
                        <DefaultButtons size="sm" className="font-regular" onClick={() => emailValidate(emailChkValue)}>인증하기</DefaultButtons>
                    </div>
                </div>
                <div className="space-y-1 my-7">
                    <div className='font-bold'>비밀번호</div>
                    <input type='password' className={clsx(
                        `w-full text-xl font-bold py-0.5 text-xl outline-none border-[1px] px-2 transition-colors duration-300`,
                        isPwdValid === null && "border-[#989898]",
                        isPwdValid === false && "border-red-400",
                        isPwdValid === true && "border-green-600"
                    )}
                        autoComplete='new-password'
                        onChange={e => pwdRegexCheck(e.target.value)}
                        ref={pwdRef}
                    />
                    <div className={clsx(
                        'font-regluar text-xs transition-colors duration-300',
                        isPwdValid === null && "text-[#B1B1B1]",
                        isPwdValid === false && "text-red-400",
                        isPwdValid === true && "text-green-600",
                    )}>
                        {isPwdValid === null && "비밀번호는 8~20자, 영문+숫자 및 특수문자를 포함해야 합니다."}
                        {isPwdValid === false && "비밀번호 조건에 맞지 않습니다."}
                        {isPwdValid === true && "비밀번호 조건에 맞습니다."}
                    </div>
                </div>

                <div className="space-y-1 mb-7">
                    <div className='font-bold'>비밀번호 확인</div>
                    <input type='password' className={clsx(
                        `w-full text-xl font-bold py-0.5 text-xl outline-none border-[1px] px-2 transition-colors duration-300`,
                        pwdMatch === null && "border-[#989898]",
                        pwdMatch === false && "border-red-400",
                        pwdMatch === true && "border-green-600"
                    )}
                        autoComplete='new-password'
                        value={confirmPwd}
                        onChange={e => pwdMatchCheck(e.target.value)} 
                        ref={confirmPwdRef}
                        />
                    <div className={clsx(
                        'font-regluar text-xs transition-colors duration-300',
                        pwdMatch === null && "text-[#B1B1B1]",
                        pwdMatch === false && "text-red-400",
                        pwdMatch === true && "text-green-600",
                    )}>
                        {pwdMatch === null && "비밀번호를 다시 입력해주세요"}
                        {pwdMatch === false && "비밀번호 조건에 맞지 않습니다."}
                        {pwdMatch === true && "비밀번호 조건에 맞습니다."}
                    </div>
                </div> 
                <div className="space-y-1 mb-7">
                    <div className='font-bold'>성명</div>
                    <input className='w-full py-0.5 outline-none border-[1px] border-[#989898] px-2'
                        value={name} onChange={e=> setName(e.target.value)}
                        ref={nameRef}
                    />
                </div>
                <div className="space-y-1 mb-10">
                    <div className='font-bold'>핸드폰 번호</div>
                    <div className='flex space-x-3 items-center'>
                        <select 
                            className='max-w-[135px] p-1 outline-none border-[1px] border-[#989898] font-bold px-2'
                            value={phonePrefix} onChange={ e => setPhonePrefix(e.target.value) }
                        >
                            <option value={"010"}>010</option>
                            <option value={"011"}>011</option>
                            <option value={"012"}>012</option>
                        </select>
                        <span className='font-bold'>-</span>
                        <input className='max-w-[135px] py-0.5 outline-none border-[1px] border-[#989898] font-regular px-2'
                            value={phoneMiddle} onChange={ e => setPhoneMiddle(e.target.value) }
                            ref={phoneMidRef}
                        />
                        <span className='font-bold'>-</span>
                        <input className='max-w-[135px] py-0.5 outline-none border-[1px] border-[#989898] font-regular px-2'
                            value={phoneLast} onChange={ e => setPhoneLast(e.target.value) }
                            ref={phoneLastRef}
                        />
                    </div>
                </div>
                <div>
                    <SignUpButton className='w-full font-bold' onClick={handleSubmit}>회원가입</SignUpButton>
                </div>
            </div>
        </form>
    )
}

export default SignUpBox