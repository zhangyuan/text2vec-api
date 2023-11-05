.PNONY: serve
serve:
	uvicorn main:app --reload --host 0.0.0.0
