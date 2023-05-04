import React from "react";

export const ItemPlusButton: React.FC<React.ComponentProps<"button">> = (props) => {
    return (
        <button type="button" className="text-white bg-blue-400 focus:ring-4 focus:outline-none focus:ring-[#3b5998]/50 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:focus:ring-[#3b5998]/55 mr-2 mb-2" {...props} />
    );
}