import React from "react";

type Props = { children: React.ReactNode, title: string };

export const FormSection: React.FC<Props> = (props) => {
    return (
        <div className="border-b border-gray-600 mt-6 pb-6 last:border-b-0 first:mt-0">
            <h3 className="text-base font-semibold leading-7">{props.title}</h3>
            <div className="mt-4">{props.children}</div>
        </div>
    );
};