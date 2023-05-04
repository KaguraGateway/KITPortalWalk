import React from "react";

type Props = {
    label: string,
    name: string
};
export const TextField: React.FC<Props> = (props) => {
    return (
        <div>
            <label className="block text-sm font-medium leading-6" htmlFor={props.name}>{props.label}</label>
            <div className="mt-2">
                <input type="text" className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" name={props.name} id={props.name} />
            </div>
        </div>
    );
}