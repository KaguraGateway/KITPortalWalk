import React from "react"
import { TextField } from "../TextField";
import { FormSection } from "../FormSection";

type Props = { greeting: string }

export const GraduationRequirementForm: React.FC<Props> = (props) => {
    return (
        <>
            <FormSection title="入学年">
                <div className="sm:col-span-3">
                    <TextField label="入学年度" name="admission_year" />
                </div>
            </FormSection>
        </>
    )
};
