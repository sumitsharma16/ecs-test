import { Router } from "express";

const router = Router();

router.get("/", (req, res) => res.json({ message: "Hello from ECS v2 🎉" }));

router.get("/health", (req, res) => {
  res.status(200).json({ status: "ok" });
});
export default router;
