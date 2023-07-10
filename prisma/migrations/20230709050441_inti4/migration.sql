/*
  Warnings:

  - You are about to drop the column `date` on the `TeacherTagging` table. All the data in the column will be lost.
  - You are about to drop the column `fkSalesTeamId` on the `TeacherTagging` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `TeacherTagging` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[fkSchoolId,fkTeacherId]` on the table `TeacherTagging` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `fkSchoolId` to the `TeacherTagging` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "teacher"."TeacherTagging" DROP CONSTRAINT "TeacherTagging_fkSalesTeamId_fkey";

-- DropIndex
DROP INDEX "teacher"."TeacherTagging_fkSalesTeamId_fkTeacherId_date_key";

-- AlterTable
ALTER TABLE "teacher"."TeacherTagging" DROP COLUMN "date",
DROP COLUMN "fkSalesTeamId",
DROP COLUMN "status",
ADD COLUMN     "fkSchoolId" UUID NOT NULL,
ADD COLUMN     "salesTeamId" UUID;

-- CreateIndex
CREATE INDEX "TeacherTagging_fkSchoolId_idx" ON "teacher"."TeacherTagging"("fkSchoolId");

-- CreateIndex
CREATE UNIQUE INDEX "TeacherTagging_fkSchoolId_fkTeacherId_key" ON "teacher"."TeacherTagging"("fkSchoolId", "fkTeacherId");

-- AddForeignKey
ALTER TABLE "teacher"."TeacherTagging" ADD CONSTRAINT "TeacherTagging_fkSchoolId_fkey" FOREIGN KEY ("fkSchoolId") REFERENCES "school"."schoolMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher"."TeacherTagging" ADD CONSTRAINT "TeacherTagging_salesTeamId_fkey" FOREIGN KEY ("salesTeamId") REFERENCES "sales"."salesTeam"("id") ON DELETE SET NULL ON UPDATE CASCADE;
