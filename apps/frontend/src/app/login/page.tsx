import LoginBox from "@/components/LoginBox";
import SocialLogin from "@/components/SocialLogin";

export default function login() {
    return (
        <div className="h-[calc(100%)] pt-[55px]">
            <LoginBox/>
            <SocialLogin/>
        </div>
    )
}