-- CreateTable
CREATE TABLE "Staff" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Staff_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Student" (
    "id" TEXT NOT NULL,
    "staff_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "matric_no" TEXT NOT NULL,
    "fingerprint" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Course" (
    "id" TEXT NOT NULL,
    "staff_id" TEXT NOT NULL,
    "course_name" TEXT NOT NULL,
    "course_code" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Attendance" (
    "id" TEXT NOT NULL,
    "staff_id" TEXT NOT NULL,
    "course_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "date" TEXT NOT NULL,

    CONSTRAINT "Attendance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StudentCourse" (
    "student_id" TEXT NOT NULL,
    "course_id" TEXT NOT NULL,

    CONSTRAINT "StudentCourse_pkey" PRIMARY KEY ("student_id","course_id")
);

-- CreateTable
CREATE TABLE "StudentAttendance" (
    "student_id" TEXT NOT NULL,
    "attendance_id" TEXT NOT NULL,

    CONSTRAINT "StudentAttendance_pkey" PRIMARY KEY ("student_id","attendance_id")
);

-- CreateTable
CREATE TABLE "Token" (
    "id" TEXT NOT NULL,
    "staff_id" TEXT NOT NULL,
    "token" TEXT NOT NULL,

    CONSTRAINT "Token_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Staff_email_key" ON "Staff"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Student_matric_no_key" ON "Student"("matric_no");

-- CreateIndex
CREATE UNIQUE INDEX "Course_course_code_key" ON "Course"("course_code");

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Course" ADD CONSTRAINT "Course_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attendance" ADD CONSTRAINT "Attendance_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "Course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attendance" ADD CONSTRAINT "Attendance_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentCourse" ADD CONSTRAINT "StudentCourse_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentCourse" ADD CONSTRAINT "StudentCourse_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "Course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentAttendance" ADD CONSTRAINT "StudentAttendance_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentAttendance" ADD CONSTRAINT "StudentAttendance_attendance_id_fkey" FOREIGN KEY ("attendance_id") REFERENCES "Attendance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
