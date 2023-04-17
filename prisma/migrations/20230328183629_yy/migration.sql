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
CREATE SCHEMA IF NOT EXISTS "library";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "locations";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "master";

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
CREATE TABLE "master"."Designation" (
    "id" UUID NOT NULL,
    "roles" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Designation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "locations"."Country" (
    "id" UUID NOT NULL,
    "CounrtyName" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "locations"."State" (
    "id" UUID NOT NULL,
    "StateName" TEXT NOT NULL,
    "fkCountryId" UUID NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "State_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "locations"."City" (
    "id" UUID NOT NULL,
    "CityName" TEXT NOT NULL,
    "fkStateId" UUID NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users"."Admin" (
    "id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."SalesTeam" (
    "id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "dob" DATE NOT NULL,
    "fkDesignationId" UUID NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SalesTeam_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."SalesTeamDocuments" (
    "id" UUID NOT NULL,
    "fkSalesTeamId" UUID NOT NULL,
    "category" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SalesTeamDocuments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."SalesTeamAddress" (
    "id" UUID NOT NULL,
    "fkSalesTeamId" UUID NOT NULL,
    "fkCountryId" UUID NOT NULL,
    "fkStateId" UUID NOT NULL,
    "fkCityId" UUID NOT NULL,
    "Address" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SalesTeamAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "school"."SchoolBoard" (
    "id" UUID NOT NULL,
    "boardname" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SchoolBoard_pkey" PRIMARY KEY ("id")
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
    "fkSchoolBoard" UUID NOT NULL,
    "fkSalesTeamId" UUID NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "schoolMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "school"."SchoolMasterAddress" (
    "id" UUID NOT NULL,
    "fkSchoolId" UUID NOT NULL,
    "fkCountryId" UUID NOT NULL,
    "fkStateId" UUID NOT NULL,
    "fkCityId" UUID NOT NULL,
    "Address" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SchoolMasterAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Classmaster" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Classmaster_pkey" PRIMARY KEY ("id")
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
CREATE TABLE "students"."StudentMaster" (
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

    CONSTRAINT "StudentMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students"."StudentParents" (
    "id" UUID NOT NULL,
    "fkStudentId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "relation" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StudentParents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students"."StudentDocuments" (
    "id" UUID NOT NULL,
    "fkStudentId" UUID NOT NULL,
    "category" TEXT NOT NULL,
    "docUrl" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StudentDocuments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students"."StudentAddress" (
    "id" UUID NOT NULL,
    "fkStudentId" UUID NOT NULL,
    "fkCountryId" UUID NOT NULL,
    "fkStateId" UUID NOT NULL,
    "fkCityId" UUID NOT NULL,
    "Address" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StudentAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."TeacherDepartment" (
    "id" UUID NOT NULL,
    "department" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TeacherDepartment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."TecherMaster" (
    "id" UUID NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "dob" DATE NOT NULL,
    "teacherId" TEXT NOT NULL,
    "fkTeacherDepartmentId" UUID NOT NULL,
    "profileImg" TEXT NOT NULL,
    "joiningDate" DATE NOT NULL,
    "fkDesignationId" UUID NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TecherMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."TeacherExprience" (
    "id" UUID NOT NULL,
    "fkTeacherId" UUID NOT NULL,
    "skills" JSONB[],
    "experience" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TeacherExprience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."TeacherDocuments" (
    "id" UUID NOT NULL,
    "fkTeacherId" UUID NOT NULL,
    "category" TEXT NOT NULL,
    "docUrl" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TeacherDocuments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher"."TeacherAddress" (
    "id" UUID NOT NULL,
    "fkTeacherId" UUID NOT NULL,
    "fkCountryId" UUID NOT NULL,
    "fkStateId" UUID NOT NULL,
    "fkCityId" UUID NOT NULL,
    "Address" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TeacherAddress_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Designation_roles_key" ON "master"."Designation"("roles");

-- CreateIndex
CREATE UNIQUE INDEX "Country_CounrtyName_key" ON "locations"."Country"("CounrtyName");

-- CreateIndex
CREATE UNIQUE INDEX "State_StateName_key" ON "locations"."State"("StateName");

-- CreateIndex
CREATE INDEX "State_fkCountryId_idx" ON "locations"."State"("fkCountryId");

-- CreateIndex
CREATE INDEX "City_fkStateId_idx" ON "locations"."City"("fkStateId");

-- CreateIndex
CREATE UNIQUE INDEX "Admin_email_key" ON "users"."Admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "SalesTeam_email_key" ON "sales"."SalesTeam"("email");

-- CreateIndex
CREATE UNIQUE INDEX "SalesTeam_phone_key" ON "sales"."SalesTeam"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "SchoolBoard_boardname_key" ON "school"."SchoolBoard"("boardname");

-- CreateIndex
CREATE UNIQUE INDEX "schoolType_schoolType_key" ON "school"."schoolType"("schoolType");

-- CreateIndex
CREATE UNIQUE INDEX "Classmaster_name_key" ON "public"."Classmaster"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Subjectmaster_name_key" ON "public"."Subjectmaster"("name");

-- CreateIndex
CREATE UNIQUE INDEX "StudentMaster_email_key" ON "students"."StudentMaster"("email");

-- CreateIndex
CREATE UNIQUE INDEX "StudentMaster_admissionId_key" ON "students"."StudentMaster"("admissionId");

-- CreateIndex
CREATE UNIQUE INDEX "StudentParents_phone_key" ON "students"."StudentParents"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "StudentParents_email_key" ON "students"."StudentParents"("email");

-- CreateIndex
CREATE UNIQUE INDEX "TeacherDepartment_department_key" ON "teacher"."TeacherDepartment"("department");

-- CreateIndex
CREATE UNIQUE INDEX "TecherMaster_email_key" ON "teacher"."TecherMaster"("email");

-- CreateIndex
CREATE UNIQUE INDEX "TecherMaster_phone_key" ON "teacher"."TecherMaster"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "TecherMaster_teacherId_key" ON "teacher"."TecherMaster"("teacherId");

-- AddForeignKey
ALTER TABLE "locations"."State" ADD CONSTRAINT "State_fkCountryId_fkey" FOREIGN KEY ("fkCountryId") REFERENCES "locations"."Country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "locations"."City" ADD CONSTRAINT "City_fkStateId_fkey" FOREIGN KEY ("fkStateId") REFERENCES "locations"."State"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales"."SalesTeam" ADD CONSTRAINT "SalesTeam_fkDesignationId_fkey" FOREIGN KEY ("fkDesignationId") REFERENCES "master"."Designation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales"."SalesTeamDocuments" ADD CONSTRAINT "SalesTeamDocuments_fkSalesTeamId_fkey" FOREIGN KEY ("fkSalesTeamId") REFERENCES "sales"."SalesTeam"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."SalesTeamAddress" ADD CONSTRAINT "SalesTeamAddress_fkSalesTeamId_fkey" FOREIGN KEY ("fkSalesTeamId") REFERENCES "sales"."SalesTeam"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."SalesTeamAddress" ADD CONSTRAINT "SalesTeamAddress_fkCountryId_fkey" FOREIGN KEY ("fkCountryId") REFERENCES "locations"."Country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."SalesTeamAddress" ADD CONSTRAINT "SalesTeamAddress_fkStateId_fkey" FOREIGN KEY ("fkStateId") REFERENCES "locations"."State"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."SalesTeamAddress" ADD CONSTRAINT "SalesTeamAddress_fkCityId_fkey" FOREIGN KEY ("fkCityId") REFERENCES "locations"."City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMaster" ADD CONSTRAINT "schoolMaster_fkSchoolType_fkey" FOREIGN KEY ("fkSchoolType") REFERENCES "school"."schoolType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMaster" ADD CONSTRAINT "schoolMaster_fkSchoolBoard_fkey" FOREIGN KEY ("fkSchoolBoard") REFERENCES "school"."SchoolBoard"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."schoolMaster" ADD CONSTRAINT "schoolMaster_fkSalesTeamId_fkey" FOREIGN KEY ("fkSalesTeamId") REFERENCES "sales"."SalesTeam"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."SchoolMasterAddress" ADD CONSTRAINT "SchoolMasterAddress_fkSchoolId_fkey" FOREIGN KEY ("fkSchoolId") REFERENCES "school"."schoolMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."SchoolMasterAddress" ADD CONSTRAINT "SchoolMasterAddress_fkCountryId_fkey" FOREIGN KEY ("fkCountryId") REFERENCES "locations"."Country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."SchoolMasterAddress" ADD CONSTRAINT "SchoolMasterAddress_fkStateId_fkey" FOREIGN KEY ("fkStateId") REFERENCES "locations"."State"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school"."SchoolMasterAddress" ADD CONSTRAINT "SchoolMasterAddress_fkCityId_fkey" FOREIGN KEY ("fkCityId") REFERENCES "locations"."City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."StudentParents" ADD CONSTRAINT "StudentParents_fkStudentId_fkey" FOREIGN KEY ("fkStudentId") REFERENCES "students"."StudentMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."StudentDocuments" ADD CONSTRAINT "StudentDocuments_fkStudentId_fkey" FOREIGN KEY ("fkStudentId") REFERENCES "students"."StudentMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."StudentAddress" ADD CONSTRAINT "StudentAddress_fkStudentId_fkey" FOREIGN KEY ("fkStudentId") REFERENCES "students"."StudentMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."StudentAddress" ADD CONSTRAINT "StudentAddress_fkCountryId_fkey" FOREIGN KEY ("fkCountryId") REFERENCES "locations"."Country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."StudentAddress" ADD CONSTRAINT "StudentAddress_fkStateId_fkey" FOREIGN KEY ("fkStateId") REFERENCES "locations"."State"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students"."StudentAddress" ADD CONSTRAINT "StudentAddress_fkCityId_fkey" FOREIGN KEY ("fkCityId") REFERENCES "locations"."City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TecherMaster" ADD CONSTRAINT "TecherMaster_fkTeacherDepartmentId_fkey" FOREIGN KEY ("fkTeacherDepartmentId") REFERENCES "teacher"."TeacherDepartment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TecherMaster" ADD CONSTRAINT "TecherMaster_fkDesignationId_fkey" FOREIGN KEY ("fkDesignationId") REFERENCES "master"."Designation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherExprience" ADD CONSTRAINT "TeacherExprience_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."TecherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherDocuments" ADD CONSTRAINT "TeacherDocuments_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."TecherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherAddress" ADD CONSTRAINT "TeacherAddress_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."TecherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherAddress" ADD CONSTRAINT "TeacherAddress_fkCountryId_fkey" FOREIGN KEY ("fkCountryId") REFERENCES "locations"."Country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherAddress" ADD CONSTRAINT "TeacherAddress_fkStateId_fkey" FOREIGN KEY ("fkStateId") REFERENCES "locations"."State"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherAddress" ADD CONSTRAINT "TeacherAddress_fkCityId_fkey" FOREIGN KEY ("fkCityId") REFERENCES "locations"."City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
