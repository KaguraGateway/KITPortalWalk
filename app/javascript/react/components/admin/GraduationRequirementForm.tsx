import React, { memo, useMemo, useState } from "react"
import { TextField } from "../TextField";
import { FormSection } from "../FormSection";
import { ItemPlusButton } from "../ItemPlusButton";

type CourseCategory = {
    subjectCategories: SubjectCategory[]
};
type SubjectCategory = {
    subjectGroups: number
};

const SubjectGroups: React.FC<{ subjectCategory: SubjectCategory }> = (props) => {
    const doms = [];
    for (let i = 0; i < props.subjectCategory.subjectGroups; i++) {
        doms.push(
            <div className="mt-8 first:mt-0 flex items-center" key={i}>
                <div className="w-1/4">
                    <TextField label="科目名" name={`course_category[][subject_category][][subject_group][][title]`} />
                </div>
                <div className="w-1/4 ml-4">
                    <TextField label="卒業に必要な最低単位数" name={`course_category[][subject_category][][subject_group][][min_credit]`} />
                </div>
            </div>
        )
    }
    return <div className="mb-4">{doms}</div>;
};

const SubjectCategories: React.FC<{ courseCategory: CourseCategory, courseCategoryIndex: number, setCourseCategories: (value: React.SetStateAction<CourseCategory[]>) => void }> = (props) => {
    const handleAddSubjectGroupBtn = (courseCategoryIndex: number, subjectCategoryIndex: number) => {
        props.setCourseCategories((prev) => {
            prev[courseCategoryIndex].subjectCategories[subjectCategoryIndex].subjectGroups += 1;
            return [...prev];
        });
    }

    const doms = [];
    for (const [index, subjectCategory] of props.courseCategory.subjectCategories.entries()) {
        doms.push(
            <div className="mt-8 first:mt-0">
                <div className="w-1/4">
                    <TextField key={index} label="科目区分名" name={`course_category[][subject_category][][title]`} />
                </div>
                <div className="mt-2 ml-8 pl-8 border-l">
                    <SubjectGroups subjectCategory={subjectCategory} />
                    <ItemPlusButton onClick={() => { handleAddSubjectGroupBtn(props.courseCategoryIndex, index) }}>
                        <i className="fa-sharp fa-solid fa-plus w-4 h-4 mr-2 -ml-1"></i>
                        科目を追加する
                    </ItemPlusButton>
                </div>
            </div>
        )
    }
    return <div className="mb-4">{doms}</div>;
};

const CourseCategories: React.FC<{ courseCategories: Array<CourseCategory>, setCourseCategories: (value: React.SetStateAction<CourseCategory[]>) => void }> = (props) => {
    const handleAddSubjectCategoryBtn = (courseCategoryIndex: number) => {
        props.setCourseCategories((prev) => {
            prev[courseCategoryIndex].subjectCategories.push({ subjectGroups: 1 });
            return [...prev];
        });
    }

    const doms = [];
    for (const [index, courseCategory] of props.courseCategories.entries()) {
        doms.push(
            <div className="mt-8 first:mt-0" key={index}>
                <div className="w-1/4">
                    <TextField label="課程区分名" name={`course_category[][title]`} />
                </div>
                <div className="mt-4 ml-8 pl-8 border-l">
                    <SubjectCategories courseCategory={courseCategory} courseCategoryIndex={index} setCourseCategories={props.setCourseCategories} />
                    <ItemPlusButton onClick={() => { handleAddSubjectCategoryBtn(index) }}>
                        <i className="fa-sharp fa-solid fa-plus w-4 h-4 mr-2 -ml-1"></i>
                        科目区分を追加する
                    </ItemPlusButton>
                </div>
            </div>
        );
    }
    return <div>{doms}</div>;
}

const RequirementsFormSection: React.FC = () => {
    const [courseCategories, setCourseCategories] = useState<Array<CourseCategory>>([]);

    const handleAddCourseCategoryBtn = () => {
        setCourseCategories((prev) => [...prev, { subjectCategories: [{ subjectGroups: 1 }] }]);
    }

    return (
        <div>
            <CourseCategories courseCategories={courseCategories} setCourseCategories={setCourseCategories} />
            <div className="mt-8">
                <ItemPlusButton onClick={handleAddCourseCategoryBtn}>
                    <i className="fa-sharp fa-solid fa-plus w-4 h-4 mr-2 -ml-1"></i>
                    課程区分を追加する
                </ItemPlusButton>
            </div>
        </div>
    );
}

export const GraduationRequirementForm: React.FC = () => {
    return (
        <>
            <FormSection title="入学年">
                <div className="w-1/4">
                    <TextField label="入学年度" name="admission_year" />
                </div>
            </FormSection>
            <FormSection title="卒業要件">
                <RequirementsFormSection />
            </FormSection>
        </>
    )
};
