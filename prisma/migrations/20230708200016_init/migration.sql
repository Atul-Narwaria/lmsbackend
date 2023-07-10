-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "accounts";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "activity";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "blogs";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "classroom";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "courses";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "exam";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "library";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "locations";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "products";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "sales";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "school";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "students";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "teacher";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "users";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "website";

-- CreateTable
CREATE TABLE "public"."designation" (
    "id" UUID NOT NULL,
    "roles" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "designation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "locations"."country" (
    "id" UUID NOT NULL,
    "CounrtyName" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "locations"."state" (
    "id" UUID NOT NULL,
    "stateName" TEXT NOT NULL,
    "fkCountryId" UUID NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "state_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "locations"."city" (
    "id" UUID NOT NULL,
    "cityName" TEXT NOT NULL,
    "fkstateId" UUID NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "city_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users"."admin" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."salesTeam" (
    "id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "dob" DATE NOT NULL,
    "fkdesignationId" UUID NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "salesTeam_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."salesTeamDocuments" (
    "id" UUID NOT NULL,
    "fksalesTeamId" UUID NOT NULL,
    "category" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "salesTeamDocuments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."salesTeamAddress" (
    "id" UUID NOT NULL,
    "fksalesTeamId" UUID NOT NULL,
    "fkcountryId" UUID NOT NULL,
    "fkstateId" UUID NOT NULL,
    "fkcityId" UUID NOT NULL,
    "Address" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "salesTeamAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "school"."schoolBoard" (
    "id" UUID NOT NULL,
    "boardname" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "schoolBoard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "school"."schoolType" (
    "id" UUID NOT NULL,
    "schoolType" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "schoolType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "school"."schoolMaster" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "afflicationCode" TEXT NOT NULL,
    "fkSchoolType" UUID NOT NULL,
    "fkschoolBoard" UUID NOT NULL,
    "fksalesTeamId" UUID NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "schoolMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "school"."schoolMasterAddress" (
    "id" UUID NOT NULL,
    "fkSchoolId" UUID NOT NULL,
    "fkcountryId" UUID NOT NULL,
    "fkstateId" UUID NOT NULL,
    "fkcityId" UUID NOT NULL,
    "Address" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "schoolMasterAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."classmaster" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "classmaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Subjectmaster" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Subjectmaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students"."studentMaster" (
    "id" UUID NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "dob" DATE NOT NULL,
    "admissionId" TEXT NOT NULL,
    "rollNo" TEXT NOT NULL,
    "profileImg" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "studentMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students"."studentParents" (
    "id" UUID NOT NULL,
    "fkStudentId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "relation" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "studentParents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students"."studentDocuments" (
    "id" UUID NOT NULL,
    "fkStudentId" UUID NOT NULL,
    "category" TEXT NOT NULL,
    "docUrl" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "studentDocuments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students"."studentAddress" (
    "id" UUID NOT NULL,
    "fkStudentId" UUID NOT NULL,
    "fkcountryId" UUID NOT NULL,
    "fkstateId" UUID NOT NULL,
    "fkcityId" UUID NOT NULL,
    "Address" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "studentAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."teacherMaster" (
    "id" UUID NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "dob" DATE NOT NULL,
    "teacherId" TEXT NOT NULL,
    "profileImg" TEXT NOT NULL,
    "joiningDate" DATE NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "teacherMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."teacherExprience" (
    "id" UUID NOT NULL,
    "fkTeacherId" UUID NOT NULL,
    "skills" JSONB[],
    "experience" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "teacherExprience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."teacherDocuments" (
    "id" UUID NOT NULL,
    "fkTeacherId" UUID NOT NULL,
    "category" TEXT NOT NULL,
    "docUrl" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "teacherDocuments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."teacherAddress" (
    "id" UUID NOT NULL,
    "fkTeacherId" UUID NOT NULL,
    "fkcountryId" UUID NOT NULL,
    "fkstateId" UUID NOT NULL,
    "fkcityId" UUID NOT NULL,
    "Address" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "teacherAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "school"."schoolLogin" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "schoolLogin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "exam"."questionMaster" (
    "id" UUID NOT NULL,
    "fk_class_id" UUID NOT NULL,
    "fk_subject_id" UUID NOT NULL,
    "category" TEXT NOT NULL,
    "chapter" INTEGER NOT NULL,
    "question" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "questionMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "exam"."answerMaster" (
    "id" UUID NOT NULL,
    "fk_question_id" UUID NOT NULL,
    "option" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "answerMaster_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "designation_roles_key" ON "public"."designation"("roles");

-- CreateIndex
CREATE UNIQUE INDEX "country_CounrtyName_key" ON "locations"."country"("CounrtyName");

-- CreateIndex
CREATE UNIQUE INDEX "state_stateName_key" ON "locations"."state"("stateName");

-- CreateIndex
CREATE INDEX "state_fkCountryId_idx" ON "locations"."state"("fkCountryId");

-- CreateIndex
CREATE INDEX "city_fkstateId_idx" ON "locations"."city"("fkstateId");

-- CreateIndex
CREATE UNIQUE INDEX "admin_email_key" ON "users"."admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "admin_phone_key" ON "users"."admin"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "salesTeam_email_key" ON "sales"."salesTeam"("email");

-- CreateIndex
CREATE UNIQUE INDEX "salesTeam_phone_key" ON "sales"."salesTeam"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "schoolBoard_boardname_key" ON "school"."schoolBoard"("boardname");

-- CreateIndex
CREATE UNIQUE INDEX "schoolType_schoolType_key" ON "school"."schoolType"("schoolType");

-- CreateIndex
CREATE UNIQUE INDEX "classmaster_name_key" ON "public"."classmaster"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Subjectmaster_name_key" ON "public"."Subjectmaster"("name");

-- CreateIndex
CREATE UNIQUE INDEX "studentMaster_email_key" ON "students"."studentMaster"("email");

-- CreateIndex
CREATE UNIQUE INDEX "studentMaster_phone_key" ON "students"."studentMaster"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "studentMaster_admissionId_key" ON "students"."studentMaster"("admissionId");

-- CreateIndex
CREATE UNIQUE INDEX "studentParents_phone_key" ON "students"."studentParents"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "studentParents_email_key" ON "students"."studentParents"("email");

-- CreateIndex
CREATE UNIQUE INDEX "teacherMaster_email_key" ON "teacher"."teacherMaster"("email");

-- CreateIndex
CREATE UNIQUE INDEX "teacherMaster_phone_key" ON "teacher"."teacherMaster"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "teacherMaster_teacherId_key" ON "teacher"."teacherMaster"("teacherId");

-- CreateIndex
CREATE UNIQUE INDEX "schoolLogin_email_key" ON "school"."schoolLogin"("email");

-- CreateIndex
CREATE INDEX "questionMaster_fk_subject_id_idx" ON "exam"."questionMaster"("fk_subject_id");

-- CreateIndex
CREATE UNIQUE INDEX "questionMaster_fk_class_id_fk_subject_id_category_chapter_q_key" ON "exam"."questionMaster"("fk_class_id", "fk_subject_id", "category", "chapter", "question");

-- CreateIndex
CREATE INDEX "answerMaster_fk_question_id_idx" ON "exam"."answerMaster"("fk_question_id");

-- AddForeignKey
ALTER TABLE "locations"."state" ADD CONSTRAINT "state_fkCountryId_fkey" FOREIGN KEY ("fkCountryId") REFERENCES "locations"."country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "locations"."city" ADD CONSTRAINT "city_fkstateId_fkey" FOREIGN KEY ("fkstateId") REFERENCES "locations"."state"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales"."salesTeam" ADD CONSTRAINT "salesTeam_fkdesignationId_fkey" FOREIGN KEY ("fkdesignationId") REFERENCES "public"."designation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales"."salesTeamDocuments" ADD CONSTRAINT "salesTeamDocuments_fksalesTeamId_fkey" FOREIGN KEY ("fksalesTeamId") REFERENCES "sales"."salesTeam"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."salesTeamAddress" ADD CONSTRAINT "salesTeamAddress_fksalesTeamId_fkey" FOREIGN KEY ("fksalesTeamId") REFERENCES "sales"."salesTeam"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."salesTeamAddress" ADD CONSTRAINT "salesTeamAddress_fkcountryId_fkey" FOREIGN KEY ("fkcountryId") REFERENCES "locations"."country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."salesTeamAddress" ADD CONSTRAINT "salesTeamAddress_fkstateId_fkey" FOREIGN KEY ("fkstateId") REFERENCES "locations"."state"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."salesTeamAddress" ADD CONSTRAINT "salesTeamAddress_fkcityId_fkey" FOREIGN KEY ("fkcityId") REFERENCES "locations"."city"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMaster" ADD CONSTRAINT "schoolMaster_fkSchoolType_fkey" FOREIGN KEY ("fkSchoolType") REFERENCES "school"."schoolType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMaster" ADD CONSTRAINT "schoolMaster_fkschoolBoard_fkey" FOREIGN KEY ("fkschoolBoard") REFERENCES "school"."schoolBoard"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMaster" ADD CONSTRAINT "schoolMaster_fksalesTeamId_fkey" FOREIGN KEY ("fksalesTeamId") REFERENCES "sales"."salesTeam"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMasterAddress" ADD CONSTRAINT "schoolMasterAddress_fkSchoolId_fkey" FOREIGN KEY ("fkSchoolId") REFERENCES "school"."schoolMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMasterAddress" ADD CONSTRAINT "schoolMasterAddress_fkcountryId_fkey" FOREIGN KEY ("fkcountryId") REFERENCES "locations"."country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMasterAddress" ADD CONSTRAINT "schoolMasterAddress_fkstateId_fkey" FOREIGN KEY ("fkstateId") REFERENCES "locations"."state"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMasterAddress" ADD CONSTRAINT "schoolMasterAddress_fkcityId_fkey" FOREIGN KEY ("fkcityId") REFERENCES "locations"."city"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."studentParents" ADD CONSTRAINT "studentParents_fkStudentId_fkey" FOREIGN KEY ("fkStudentId") REFERENCES "students"."studentMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."studentDocuments" ADD CONSTRAINT "studentDocuments_fkStudentId_fkey" FOREIGN KEY ("fkStudentId") REFERENCES "students"."studentMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."studentAddress" ADD CONSTRAINT "studentAddress_fkStudentId_fkey" FOREIGN KEY ("fkStudentId") REFERENCES "students"."studentMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."studentAddress" ADD CONSTRAINT "studentAddress_fkcountryId_fkey" FOREIGN KEY ("fkcountryId") REFERENCES "locations"."country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."studentAddress" ADD CONSTRAINT "studentAddress_fkstateId_fkey" FOREIGN KEY ("fkstateId") REFERENCES "locations"."state"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."studentAddress" ADD CONSTRAINT "studentAddress_fkcityId_fkey" FOREIGN KEY ("fkcityId") REFERENCES "locations"."city"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."teacherExprience" ADD CONSTRAINT "teacherExprience_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."teacherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."teacherDocuments" ADD CONSTRAINT "teacherDocuments_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."teacherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."teacherAddress" ADD CONSTRAINT "teacherAddress_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."teacherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."teacherAddress" ADD CONSTRAINT "teacherAddress_fkcountryId_fkey" FOREIGN KEY ("fkcountryId") REFERENCES "locations"."country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."teacherAddress" ADD CONSTRAINT "teacherAddress_fkstateId_fkey" FOREIGN KEY ("fkstateId") REFERENCES "locations"."state"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."teacherAddress" ADD CONSTRAINT "teacherAddress_fkcityId_fkey" FOREIGN KEY ("fkcityId") REFERENCES "locations"."city"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "exam"."questionMaster" ADD CONSTRAINT "questionMaster_fk_class_id_fkey" FOREIGN KEY ("fk_class_id") REFERENCES "public"."classmaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "exam"."questionMaster" ADD CONSTRAINT "questionMaster_fk_subject_id_fkey" FOREIGN KEY ("fk_subject_id") REFERENCES "public"."Subjectmaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "exam"."answerMaster" ADD CONSTRAINT "answerMaster_fk_question_id_fkey" FOREIGN KEY ("fk_question_id") REFERENCES "exam"."questionMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
