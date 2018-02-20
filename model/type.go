package model

import (
	"database/sql"
	"time"
)

type CircleDetail struct {
	Circle Circle
	Events []Event `db:"events" json:"events"`
	Tags   []Tag   `db:"tags" json:"tags"`
}

type Circle struct {
	ID              uint   `db:"id" json:"id"`
	Name            string `db:"name" json:"name"`
	URLName         string `db:"url_name" json:"url_name"`
	Number          int    `db:"number" json:"number"`
	GenderRatio     string `db:"gender_ratio" json:"gender_ratio"`
	Image           string `db:"image" json:"image"`
	Introduction    string `db:"introduction" json:"introduction"`
	MessageForFresh string `db:"message_for_fresh" json:"message_for_fresh"`
	DelegeteName    string `db:"delegete_name" json:"delegete_name"`
	DelegeteContact string `db:"delegete_contact" json:"delegete_contact"`
	Campus          string `db:"campus" json:"campus"`
	Excite          int    `db:"excite" json:"excite"`
	Fee             int    `db:"fee" json:"fee"`
	University      string `db:"university" json:"university"`
}

type Event struct {
	ID       uint      `db:"id" json:"id"`
	Name     string    `db:"name" json:"name"`
	Image    string    `db:"image" json:"image"`
	Agenda   time.Time `db:"agenda" json:"agenda"`
	Place    string    `db:"place" json:"place"`
	Detail   string    `db:"detail" json:"detail"`
	Capacity int       `db:"capacity" json:"capacity"`
	Fee      int       `db:"fee" json:"fee"`
}

type Tag struct {
	ID        uint   `db:"id" json:"id"`
	Name      string `db:"name" json:"name"`
	ClassName string `db:"class_name" json:"class_name"`
}

type ClassedTag struct {
	Title string `json:"title"`
	Tags  []Tag  `json:"tags"`
}

type User struct {
	ID         uint   `db:"id" json:"id"`
	University string `db:"university" json:"university"`
	Name       string `db:"name" json:"name"`
	Gender     string `db:"gender" json:"gender"`
	Mail       string `db:"mail" json:"mail"`
	Password   string `db:"password" json:"password"`
	Image      string `db:"image" json:"image"`
	Year       int    `db:"year" json:"year"`
	Department string `db:"department" json:"department"`
	Subject    string `db:"subject" json:"subject"`
}

type Comment struct {
	ID     sql.NullInt64  `db:"id" json:"id"`
	Name   sql.NullString `db:"name" json:"name"`
	Gender sql.NullString `db:"gender" json:"gender"`
	Point  sql.NullInt64  `db:"point" json:"point"`
	Text   sql.NullString `db:"text" json:"text"`
}

type Userschedule struct {
	User   User
	Events []Event `db:"events" json:"events"`
}

type UserCircleLikes struct {
	Circle []Circle `db:"circle" json:"circle"`
}

type LikeCircleDetail struct {
	Circle  Circle  `db:"circle" json:"circle"`
	Comment Comment `db:"comment" json:"comment"`
}

type CircleComment struct {
	Circle  Circle  `db:"circle" json:"circle"`
	Comment Comment `db:"comment" json:"comment"`
}

type AdminCircleEvents struct {
	ID         uint      `db:"id" json:"id"`
	Name       string    `db:"name" json:"name"`
	Image      string    `db:"image" json:"image"`
	Agenda     time.Time `db:"agenda" json:"agenda"`
	Place      string    `db:"place" json:"place"`
	Detail     string    `db:"detail" json:"detail"`
	Capacity   int       `db:"capacity" json:"capacity"`
	Fee        int       `db:"fee" json:"fee"`
	CircleID   int       `db:"circle_id" json:"circle_id"`
	CircleName string    `db:"circle_name" json:"circle_name"`
}
