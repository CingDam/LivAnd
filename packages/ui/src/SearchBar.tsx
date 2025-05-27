import React from 'react'
import { SearchMagnifyingGlass } from 'react-coolicons';

const SearchBar = () => {
  return (
    <div className='w-[664px] m-auto ml-[38px] mr-[15px]'>
        <input 
            className='bg-[#FFDFDF]  w-[100%] h-[32px] rounded-[50px] outline-none pl-[30px] text-md'
            placeholder='검색어를 입력해주세요'
        />
        <SearchMagnifyingGlass className='absolute top-2 left-[80%] cursor-pointer'/>
    </div>
  )
}

export default SearchBar
