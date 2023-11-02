.PNONY: serve
serve:
	uvicorn main:app --reload -h 0.0.0.0
