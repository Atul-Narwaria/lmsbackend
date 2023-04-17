/*
  Warnings:

  - You are about to drop the `TecherMaster` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "teacher"."TeacherAddress" DROP CONSTRAINT "TeacherAddress_fkTeacherId_fkey";

-- DropForeignKey
ALTER TABLE "teacher"."TeacherDocuments" DROP CONSTRAINT "TeacherDocuments_fkTeacherId_fkey";

-- DropForeignKey
ALTER TABLE "teacher"."TeacherExprience" DROP CONSTRAINT "TeacherExprience_fkTeacherId_fkey";

-- DropForeignKey
ALTER TABLE "teacher"."TecherMaster" DROP CONSTRAINT "TecherMaster_fkDesignationId_fkey";

-- DropForeignKey
ALTER TABLE "teacher"."TecherMaster" DROP CONSTRAINT "TecherMaster_fkTeacherDepartmentId_fkey";

-- DropTable
DROP TABLE "teacher"."TecherMaster";

-- CreateTable
CREATE TABLE "teacher"."TeacherMaster" (
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

    CONSTRAINT "TeacherMaster_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TeacherMaster_email_key" ON "teacher"."TeacherMaster"("email");

-- CreateIndex
CREATE UNIQUE INDEX "TeacherMaster_phone_key" ON "teacher"."TeacherMaster"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "TeacherMaster_teacherId_key" ON "teacher"."TeacherMaster"("teacherId");

-- AddForeignKey
ALTER TABLE "teacher"."TeacherMaster" ADD CONSTRAINT "TeacherMaster_fkTeacherDepartmentId_fkey" FOREIGN KEY ("fkTeacherDepartmentId") REFERENCES "teacher"."TeacherDepartment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherMaster" ADD CONSTRAINT "TeacherMaster_fkDesignationId_fkey" FOREIGN KEY ("fkDesignationId") REFERENCES "master"."Designation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherExprience" ADD CONSTRAINT "TeacherExprience_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."TeacherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherDocuments" ADD CONSTRAINT "TeacherDocuments_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."TeacherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherAddress" ADD CONSTRAINT "TeacherAddress_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."TeacherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
