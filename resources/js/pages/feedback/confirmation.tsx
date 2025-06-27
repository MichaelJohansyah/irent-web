import React from 'react';
import { CheckCircle, ArrowLeft, Home, MessageCircle } from 'lucide-react';
import { Link } from '@inertiajs/react';

export default function FeedbackConfirmation() {
  return (
    <div className="min-h-screen bg-background text-foreground py-12 px-4">
      <div className="max-w-2xl mx-auto">
        {/* Success Animation */}
        <div className="text-center mb-12">
          <div className="inline-flex items-center justify-center w-24 h-24 bg-gradient-to-r from-green-500 to-emerald-500 rounded-full mb-6 shadow-2xl animate-bounce">
            <CheckCircle className="w-12 h-12 text-white" />
          </div>

          <h1 className="text-4xl font-bold mb-4">Feedback Sent Successfully!</h1>

          <p className="text-lg text-muted-foreground max-w-md mx-auto mb-8">
            Thank you for taking the time to share your thoughts with us. Your feedback is valuable and helps us improve our service.
          </p>
        </div>

        {/* Info Card */}
        <div className="bg-card text-card-foreground rounded-2xl shadow-2xl border border-border overflow-hidden mb-8">
          <div className="bg-gradient-to-r from-green-500 to-emerald-500 px-8 py-6">
            <h2 className="text-2xl font-semibold text-primary-foreground flex items-center">
              <MessageCircle className="w-6 h-6 mr-3" />
              What Happens Next?
            </h2>
          </div>

          <div className="p-8">
            <div className="space-y-6">
              {[ // Info steps
                {
                  step: '1',
                  title: 'Review Process',
                  desc: 'Our team will carefully review your feedback within 1-2 business days.',
                },
                {
                  step: '2',
                  title: 'Follow-up',
                  desc: 'If your feedback requires a response, we\'ll get back to you via email.',
                },
                {
                  step: '3',
                  title: 'Implementation',
                  desc: 'Valid suggestions and improvements will be considered for future updates.',
                },
              ].map(({ step, title, desc }) => (
                <div key={step} className="flex items-start space-x-4">
                  <div className="flex-shrink-0 w-8 h-8 bg-muted rounded-full flex items-center justify-center">
                    <span className="text-primary font-semibold text-sm">{step}</span>
                  </div>
                  <div>
                    <h3 className="font-semibold text-foreground mb-2">{title}</h3>
                    <p className="text-muted-foreground">{desc}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Action Buttons */}
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link
            href={route('feedback.create')}
            className="inline-flex items-center justify-center px-6 py-3 bg-card text-card-foreground border-2 border-border rounded-xl font-semibold hover:bg-muted hover:border-muted transition-all duration-200 transform hover:scale-105 active:scale-95 shadow-md hover:shadow-lg"
          >
            <ArrowLeft className="w-5 h-5 mr-2" />
            Send More Feedback
          </Link>

          <Link
            href={route('dashboard')}
            className="inline-flex items-center justify-center px-6 py-3 bg-gradient-to-r from-primary to-accent text-primary-foreground rounded-xl font-semibold hover:from-primary/90 hover:to-accent/90 transition-all duration-200 transform hover:scale-105 active:scale-95 shadow-lg hover:shadow-xl"
          >
            <Home className="w-5 h-5 mr-2" />
            Back to Dashboard
          </Link>
        </div>

        {/* Footer */}
        <div className="text-center mt-12">
          <div className="bg-muted border border-border rounded-xl p-6">
            <p className="text-primary font-medium">
              🎉 Your feedback reference ID: <span className="font-mono">#FB-{Date.now().toString().slice(-6)}</span>
            </p>
            <p className="text-muted-foreground text-sm mt-2">
              Save this ID for future reference if needed.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
