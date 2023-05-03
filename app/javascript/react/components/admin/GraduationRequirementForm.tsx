import React from "react"

type Props = { greeting: string }

export const GraduationRequirementForm: React.FC<Props> = (props) => {
    return (
        <>
            <div className="border-b border-gray-600 pb-6">
                <h3 className="text-base font-semibold leading-7">入学年</h3>
                <div className="mt-4 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <div className="sm:col-span-3">
                        <label className="block text-sm font-medium leading-6" htmlFor="admission_year">入学年度</label>
                        <div className="mt-2">
                            <input className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" type="text" name="admission_year" id="admission_year" />
                        </div>
                    </div>
                    <div className="sm:col-span-3">
                        <label className="block text-sm font-medium leading-6" htmlFor="admission_year_external_text">入学年度外部テキスト</label>
                        <div className="mt-2">
                            <input className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" type="text" name="admission_year_external_text" id="admission_year_external_text" />
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
};
