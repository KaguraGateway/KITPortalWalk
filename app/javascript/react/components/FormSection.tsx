import React from "react";

type Props = { children: React.ReactNode, title: string };

export const FormSection: React.FC<Props> = (props) => {
    return (
        <div className="border-b border-gray-600 pb-6">
            <h3 className="text-base font-semibold leading-7">{props.title}</h3>
            <div className="mt-4 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">{props.children}</div>
        </div>
    );
};