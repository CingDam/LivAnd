import clsx from 'clsx';
import React from 'react'
import { SearchMagnifyingGlass } from 'react-coolicons';

const SearchBar = () => {
  return (
    <div className='relative w-[90%] max-w-[664px] my-auto ml-[38px] mr-[15px]'>
        <input 
            className={
              clsx(
                'w-full h-8 rounded-full pl-8 pr-10 text-md',
                'bg-red-200 outline-none'
              )
            }
            placeholder='검색어를 입력해주세요'
        />
        <SearchMagnifyingGlass className='absolute top-1/2 right-4 -translate-y-1/2 cursor-pointer'/>
    </div>
  )
}

export default SearchBar
