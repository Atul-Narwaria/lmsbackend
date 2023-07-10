/*
  Warnings:

  - You are about to drop the column `teacherId` on the `teacherMaster` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "teacher"."teacherMaster_teacherId_key";

-- AlterTable
ALTER TABLE "teacher"."teacherMaster" DROP COLUMN "teacherId";

-- CreateTable
CREATE TABLE "teacher"."TeacherTagging" (
    "id" UUID NOT NULL,
    "fkTeacherId" UUID NOT NULL,
    "fkSalesTeamId" UUID NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "status" BOOLEAN NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TeacherTagging_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TeacherTagging_fkSalesTeamId_fkTeacherId_date_key" ON "teacher"."TeacherTagging"("fkSalesTeamId", "fkTeacherId", "date");

-- AddForeignKey
ALTER TABLE "teacher"."TeacherTagging" ADD CONSTRAINT "TeacherTagging_fkTeacherId_fkey" FOREIGN KEY ("fkTeacherId") REFERENCES "teacher"."teacherMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherTagging" ADD CONSTRAINT "TeacherTagging_fkSalesTeamId_fkey" FOREIGN KEY ("fkSalesTeamId") REFERENCES "sales"."salesTeam"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
