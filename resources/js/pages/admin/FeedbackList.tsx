import React from 'react';
import AppLayout from '@/layouts/app-layout';

type Feedback = {
  id: number;
  subject: string;
  content: string;
  created_at: string;
  user: {
    id: number;
    name: string;
    email: string;
  };
};

interface Props {
  feedback?: Feedback[];
}

const FeedbackList: React.FC<Props> = ({ feedback = [] }) => {
  return (
    <AppLayout breadcrumbs={[{ title: 'User Feedback', href: '/admin/feedback' }]}>
      <div className="p-8">
        <h1 className="text-2xl font-bold mb-6 text-foreground">User Feedback</h1>

        {feedback.length === 0 ? (
          <div className="text-muted-foreground">No feedback yet.</div>
        ) : (
          <div className="space-y-4">
            {feedback.map(fb => (
              <div
                key={fb.id}
                className="border border-border rounded-lg p-4 bg-card shadow-sm max-w-4xl text-card-foreground"
              >
                <div className="font-semibold text-lg">{fb.subject}</div>
                <div className="mb-2 break-words whitespace-pre-line text-foreground">
                  {fb.content}
                </div>
                <div className="text-sm text-muted-foreground">
                  From: {fb.user.name} ({fb.user.email})<br />
                  <span className="italic">{new Date(fb.created_at).toLocaleString()}</span>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </AppLayout>
  );
};

export default FeedbackList;
