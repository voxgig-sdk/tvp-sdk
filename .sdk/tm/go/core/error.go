package core

type TvpError struct {
	IsTvpError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewTvpError(code string, msg string, ctx *Context) *TvpError {
	return &TvpError{
		IsTvpError: true,
		Sdk:              "Tvp",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *TvpError) Error() string {
	return e.Msg
}
